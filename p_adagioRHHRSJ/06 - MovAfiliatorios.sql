

--truncate table p_adagioRHHRSJ.IMSS.tblMovAfiliatorios
--select top 1 * from p_adagioRHHRSJ.IMSS.tblMovAfiliatorios

--delete IMSS.tblMovAfiliatorios
--DBCC CHECKIDENT ('IMSS.tblMovAfiliatorios', RESEED, 0);

	insert IMSS.tblMovAfiliatorios(
		Fecha
		,IDEmpleado
		,IDTipoMovimiento
		,FechaIMSS
		,FechaIDSE
		,IDRazonMovimiento
		,SalarioDiario
		,SalarioIntegrado
		,SalarioVariable
		,SalarioDiarioReal
		,IDRegPatronal
		,RespetarAntiguedad
	)
	select cast(tm.Fecha as date) as Fecha
		,e.IDEmpleado
	--	,tm.MOV_TIPO
		,ctm.IDTipoMovimiento
		,cast(tm.FECHA_IMSS as date) as FechaImss
		,cast(tm.fecha_idse as date) as FechaIDSE
		,NULL as IDRazonMovimiento
		,isnull(tm.MOV_SUELDO_DIARIO,0.00) as SalarioDiario
		,isnull(tm.MOV_SUELDO_INTEGR,0.00) as SalarioIntegrado
		,isnull(tm.MOV_SUELDO_VAR	,0.00) as SalarioVariable
		,0 as SalarioDiarioReal
		,1 as IDRegPatronal
		,0 RespetarAntiguedad
	from TRABMOVI tm
		join RH.tblEmpleados e on e.ClaveEmpleado = tm.CLAVE_TRABAJADOR
		join IMSS.tblCatTipoMovimientos ctm on ctm.Codigo = tm.MOV_TIPO
	order by e.IDEmpleado	

		-- 61,735

	exec RH.spSincronizarEmpleadosMaster




		
--SELECT *
--INTO bk.IMSSTblMovAfiliatorios_MOVCMS
--FROM delete IMSS.tblMovAfiliatorios
--WHERE IDMovAfiliatorio >= 63332
--group by IDEmpleado
--order by IDMovAfiliatorio desc