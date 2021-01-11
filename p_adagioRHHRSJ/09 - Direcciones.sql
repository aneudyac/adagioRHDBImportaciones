
	if object_id('tempdb..#tempDir') is not null drop table #tempDir

	select e.IDEmpleado, t.Calle, t.Numero,m.IDMunicipio,t.Municipio,CO.IDColonia,t.Colonia,L.IDLocalidad, t.Poblacion,s.IDEstado, t.Estado, e.FechaIngreso,'9999-12-31' as FechaFin,c.IDCodigoPostal,t.CP, ROW_NUMBER()over(partition by e.IDEmpleado order by e.ClaveEmpleado) as RN
 	INTO #tempDir
	from trabajad t
		join RH.tblEmpleadosMaster e			with (nolock) on t.CLAVE_TRABAJADOR = e.ClaveEmpleado
		LEFT JOIN SAT.tblCatEstados S			with (nolock) ON S.NombreEstado	= t.ESTADO
		LEFT JOIN SAT.tblCatMunicipios M		with (nolock) ON M.Descripcion  = t.Municipio and m.IDEstado = s.IDEstado
		LEFT JOIN SAT.tblCatLocalidades L		with (nolock) ON L.Descripcion = t.POBLACION
		LEFT JOIN SAT.tblCatCodigosPostales C	with (nolock) ON C.CodigoPostal = t.CP
		LEFT JOIN SAT.tblCatColonias CO			with (nolock) ON CO.NombreAsentamiento = t.COLONIA AND C.IDCodigoPostal = CO.IDCodigoPostal
	order by e.IDEmpleado

	delete
	from #tempDir
	where RN > 1


	BEGIN TRY
		BEGIN TRAN TransaccionDir
			MERGE RH.tblDireccionEmpleado AS TARGET
			USING #tempDir as SOURCE
			on TARGET.IDEmpleado = SOURCE.IDEmpleado
			WHEN MATCHED THEN
				update 
					set TARGET.IDPais = 151
						,TARGET.IDEstado		= SOURCE.IDEstado
						,TARGET.Estado			= case when  SOURCE.IDEstado is null then SOURCE.Estado else null end
						,TARGET.IDMunicipio		= SOURCE.IDMunicipio
						,TARGET.Municipio		= case when  SOURCE.IDMunicipio is null then SOURCE.Municipio else null end
						,TARGET.IDLocalidad		= SOURCE.IDLocalidad
						,TARGET.Localidad		= case when  SOURCE.IDLocalidad is null then SOURCE.Poblacion else null end
						,TARGET.IDCodigoPostal	= SOURCE.IDCodigoPostal
						,TARGET.CodigoPostal	= case when  SOURCE.IDCodigoPostal is null then SOURCE.CP else null end
						,TARGET.IDColonia		= SOURCE.IDColonia
						,TARGET.Colonia			= case when  SOURCE.IDColonia is null then SOURCE.Colonia else null end
						,TARGET.Calle			= SOURCE.Calle
						,TARGET.Exterior		= SOURCE.Numero
						,TARGET.FechaFin		= SOURCE.FechaFin

			WHEN NOT MATCHED BY TARGET THEN 
				INSERT(IDEmpleado,IDPais,IDEstado,Estado,IDMunicipio,Municipio,IDLocalidad,Localidad,IDCodigoPostal,CodigoPostal,IDColonia,Colonia,Calle,Exterior,FechaIni, FechaFin)
				values(SOURCE.IDEmpleado, 151
						,SOURCE.IDEstado
						,case when  SOURCE.IDEstado is null then SOURCE.Estado else null end
						,SOURCE.IDMunicipio
						,case when  SOURCE.IDMunicipio is null then SOURCE.Municipio else null end
						,SOURCE.IDLocalidad
						,case when  SOURCE.IDLocalidad is null then SOURCE.Poblacion else null end
						,SOURCE.IDCodigoPostal
						,case when  SOURCE.IDCodigoPostal is null then SOURCE.CP else null end
						,SOURCE.IDColonia
						,case when  SOURCE.IDColonia is null then SOURCE.Colonia else null end
						,SOURCE.Calle
						,SOURCE.Numero		
						,SOURCE.FechaIngreso		
						,SOURCE.FechaFin		
				)
			--WHEN NOT MATCHED BY SOURCE THEN 
			--DELETE
			OUTPUT $action; 
			--DELETED.IDMes AS IDMes, 
			--DELETED.Nombre AS Nombre,  
			--INSERTED.IDMes AS IDMes, 
			--INSERTED.Nombre AS Nombre;
			SELECT @@ROWCOUNT;
		COMMIT TRAN TransaccionDir
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN TransaccionDir

		select ERROR_MESSAGE()
	END CATCH
