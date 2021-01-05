	declare 
		@CLAVE_TRABAJADOR VARCHAR(20)

	select @CLAVE_TRABAJADOR = min(CLAVE_TRABAJADOR) from trabajad

	while exists (select top 1 1 from trabajad where CLAVE_TRABAJADOR >= @CLAVE_TRABAJADOR)
	begin
		--print @CLAVE_TRABAJADOR
		exec spActualizarFechasHistorialPuestos @CLAVE_TRABAJADOR
		exec [spActualizarFechasHistorialDepartamento] @CLAVE_TRABAJADOR
		exec [spActualizarFechasHistorialSucursal] @CLAVE_TRABAJADOR
		select @CLAVE_TRABAJADOR = min(CLAVE_TRABAJADOR) from trabajad  where CLAVE_TRABAJADOR > @CLAVE_TRABAJADOR
	end;