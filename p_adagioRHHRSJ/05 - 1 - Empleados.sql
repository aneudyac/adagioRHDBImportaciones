	declare 
		@FechaHoy date = getdate()
		,@PageNumber int = 4
		,@PageSize int = 498

	select 
		 t.CLAVE_TRABAJADOR as ClaveEmpleado	
		,T.RFC as RFC	
		,T.CURP as CURP	
		,T.AFILIACION as IMSS	
		,case when CHARINDEX(' ', ltrim(T.Nombre)) > 0 then LTRIM(RTRIM(SUBSTRING(ltrim(T.Nombre), 1, CHARINDEX(' ', ltrim(T.Nombre))))) else ltrim(T.Nombre) end AS Nombre
		,case when CHARINDEX(' ', ltrim(T.Nombre)) > 0 then LTRIM(RTRIM(SUBSTRING(ltrim(T.Nombre), CHARINDEX(' ', ltrim(T.Nombre)) + 1, 8000))) else '' end AS SegundoNombre
		,T.PATERNO as Paterno	
		,T.MATERNO as Materno	
		,'' as MunicipioNacimiento	
		,'' as EstadoNacimiento	
		,'' as PaisNacimiento	
		,FORMAT(T.FECHA_NAC,'yyyy-MM-dd') as FechaNacimiento	
		,T.E_CIVIL as EstadoCivil	
		,T.SEXO as Sexo	
		,FORMAT(T.FECHING,'yyyy-MM-dd') as FechaPrimerIngreso	
		,FORMAT(T.FECHING,'yyyy-MM-dd') as FechaIngreso	
		,FORMAT(T.PLANTA,'yyyy-MM-dd') as FechaAntiguedad	
		,'' as JornadaLaboral	
		,'' as Departamento	
		,'' as Sucursal	
		,'' as Puesto	
		,'' as Empresa	
		,s.CLAVE_REGPAT as RegPatronal	
		,'' as LayoutPago	
		,CLAVE_BANCO as Banco	
		,'' as NoCuenta	
		,'' as Interbancaria	
		,'' as NoTarjeta	
		,'' as IDBancario	
		,'' as SucursalBanco	
		,100 as SalarioDiario	
		,100 as SalarioDiarioReal	
		,100 as SalarioIntegrado	
		,100 as SalarioVariable	
		,p.CLAVE_FACTORES as TipoPrestacion	
		,lower(email) as CorreoElectronico
	from trabajad T WITH(NOLOCK)
		LEFT JOIN Trahispu PE WITH(NOLOCK) ON PE.CLAVE_TRABAJADOR = T.CLAVE_TRABAJADOR AND cast(PE.FECHA_I as date) <= @FechaHoy and cast(PE.FECHA_F as date) >= @FechaHoy
		LEFT JOIN Trahissu su WITH(NOLOCK) ON su.CLAVE_TRABAJADOR = T.CLAVE_TRABAJADOR AND cast(su.FECHA_I as date) <= @FechaHoy and cast(su.FECHA_F as date) >= @FechaHoy
		LEFT JOIN PUESTO P WITH(NOLOCK) ON P.CLAVE_PUESTO = PE.CLAVE_PUESTO
		LEFT JOIN SUCURSAL s with (nolock) on s.CLAVE_SUCURSAL = su.CLAVE_SUCURSAL
--	where t.CLAVE_TRABAJADOR >= '05142'
	order by t.CLAVE_TRABAJADOR
	OFFSET @PageSize * (@PageNumber - 1) ROWS
	FETCH NEXT @PageSize ROWS ONLY OPTION (RECOMPILE);


