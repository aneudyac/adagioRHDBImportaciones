	--if object_id('tempdb..#prestamosRhflex') is not null DROP TABLE #prestamosRhflex;

	--SELECT * 
	--into #prestamosRhflex
	--FROM TRAPREEM

	--select *
	--from Nomina.tblCatTiposPrestamo
	if object_id('tempdb..#temporal') is not null DROP TABLE #temporal;

	SELECT 
		E.ClaveEmpleado AS CODIGO
		,E.IDEmpleado,  
		CASE 
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '55' THEN 7
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '57' THEN 4
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '60' THEN 9
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '62' THEN 10
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '63' THEN 11
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '65' THEN 12
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '65E' THEN 13
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '65A' THEN 5
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '65B' THEN 14
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '65D' THEN 15
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '65C'  THEN 16
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '66'  THEN 18
			 WHEN prestamosRhflex.CLAVE_CONCEPTO = '67' THEN 17
		END as tipoPres, 
		CASE WHEN prestamosRhflex.ESTADO = 'ACTIVO' THEN 2
			 WHEN prestamosRhflex.ESTADO = 'SALDADO' THEN 4
			 WHEN prestamosRhflex.ESTADO = 'INACTIVO' THEN 5
			-- ELSE 3
		END as ESTATUS, 
		IMPORTE,--IMPORTE TOTAL

		DESCUENTO AS DESCUENTOPERIODICO,

		CASE WHEN ISNULL(DESCUENTO,0) <> 0 THEN	ROUND ( ( ISNULL(SALDO,0)  / ISNULL(DESCUENTO,0) ) , 0  ) 
		ELSE
			ISNULL(DESCUENTO,0)
		END AS CUOTAS,

		ISNULL(UPPER(prestamosRhflex.DESCRIPCION),'DESCUENTO IMPORTADO') AS DESCRIPCION,

		prestamosRhflex.FECHA AS FECHAINICIO,
		prestamosRhflex.FECHA AS FECHAINIPAG,

		ROW_NUMBER() OVER (PARTITION BY E.IDEMPLEADO ORDER BY prestamosRhflex.fecha DESC ) AS ORDEN
	INTO #temporal
	FROM TRAPREEM prestamosRhflex
		INNER JOIN RH.tblEmpleados E ON prestamosRhflex.CLAVE_TRABAJADOR = e.ClaveEmpleado

	UPDATE #temporal set CODIGO = CODIGO + '-' + cast(ORDEN as varchar)


	--select *
	--from #temporal
	--order by Importe desc
	--where FECHAINICIO is null
	--return 
	INSERT INTO [Nomina].[tblPrestamos]
	(
	 Codigo
	,IDEmpleado
	,IDTipoPrestamo
	,IDEstatusPrestamo
	,MontoPrestamo
	,Cuotas
	,CantidadCuotas
	,Descripcion
	,FechaCreacion
	,FechaInicioPago
	)
	SELECT 
	 CODIGO
	,IDEmpleado	
	,tipoPres	
	,ESTATUS	
	,IMPORTE	
	,DESCUENTOPERIODICO
	,CUOTAS	
	,DESCRIPCION	
	,FECHAINICIO	
	,FECHAINIPAG	
	 FROM #temporal
	 where tipoPres IS NOT NULL and FECHAINICIO is not null

	 insert into  [Nomina].[tblPrestamosDetalles]
	 SELECT P.IDPrestamo, NULL AS PERIODO, ( MONTOPRESTAMO - ( CUOTAS * CantidadCuotas ) ) AS MONTO, 
		p.FechaInicioPago as fecha, 'Admin' As Receptor , 1 as idusr FROM p_adagioRHHRSJ.[Nomina].[tblPrestamos] P



	-- Ultimo IDImportado 10517
	