
	--INSERT INTO p_adagioRHHRSJ.[RH].[tblInfonavitEmpleado]
	SELECT 
		E.IDEmpleado AS IDEmpleado,
		--e.ClaveEmpleado,
		R.IDRegPatronal AS IDRegPatronal,
		cast(cast (I.NUM_CRED_INFO AS bigint) AS nvarchar) AS NumeroCredito,
		1 AS IDTipoMovimiento,
		CASE WHEN I.FECHA_I_CRED IS NULL THEN '1900-01-01'
			ELSE CAST (I.FECHA_I_CRED AS DATE)  END AS Fecha,
		CASE WHEN I.TIPODECREDITOINFO = 1 THEN 1
			WHEN I.TIPODECREDITOINFO = 2 THEN 2
			WHEN I.TIPODECREDITOINFO = 3 THEN 3
			WHEN I.TIPODECREDITOINFO = 4 THEN 2
		END AS IDTipoDescuento,
		isnull(I.PORC_CRED_INFO,0) AS ValorDescuento,
		1 AS AplicaDisminucion
	FROM trabajad I
		inner join p_adagioRHHRSJ.RH.tblEmpleados E ON E.ClaveEmpleado collate database_default = I.CLAVE_TRABAJADOR collate database_default
		inner join p_adagioRHHRSJ.RH.tblRegPatronalEmpleado R ON R.IDEmpleado = E.IDEmpleado 
	where I.NUM_CRED_INFO <> '' AND I.TIPODECREDITOINFO <> '0'--  and e.IDEmpleado = 4344
	--order by e.ClaveEmpleado