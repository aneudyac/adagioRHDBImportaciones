	declare
		@Ejercicio int = 2021,
		@IDTablaImpuesto int,
		@IDTablaImpuestoNueva int
		
	/*
		select *
		from Nomina.tblTablasImpuestos 
		--where Ejercicio = @Ejercicio
		order by Ejercicio
	*/

	select @IDTablaImpuesto=min(IDTablaImpuesto) from p_adagioRHViva.Nomina.tblTablasImpuestos where Ejercicio = @Ejercicio

	while exists (select top 1 1 from  p_adagioRHViva.Nomina.tblTablasImpuestos where Ejercicio = @Ejercicio and IDTablaImpuesto >= @IDTablaImpuesto)
	begin
		insert Nomina.tblTablasImpuestos(IDPeriodicidadPago, Ejercicio, IDCalculo, Descripcion)
		select IDPeriodicidadPago, Ejercicio, IDCalculo, Descripcion
		from p_adagioRHViva.Nomina.tblTablasImpuestos 
		where Ejercicio = @Ejercicio and IDTablaImpuesto = @IDTablaImpuesto
		order by Ejercicio

		set @IDTablaImpuestoNueva = @@IDentity

		insert into NOmina.tblDetalleTablasImpuestos(IDTablaImpuesto,LimiteInferior,LimiteSuperior,CoutaFija,Porcentaje)
		select @IDTablaImpuestoNueva as IDTablaImpuesto,LimiteInferior,LimiteSuperior,CoutaFija,Porcentaje
		from  p_adagioRHViva.Nomina.tblDetalleTablasImpuestos 
		where IDTablaImpuesto = @IDTablaImpuesto

		select @IDTablaImpuesto=min(IDTablaImpuesto) from p_adagioRHViva.Nomina.tblTablasImpuestos where Ejercicio = @Ejercicio AND IDTablaImpuesto > @IDTablaImpuesto
	end