	declare @tempSalarioMinimoActual as table (
		IDSalarioMinimo int,
		Fecha date,
		SalarioMinimo decimal(18,2),
		UMA decimal(18,2),
		FactorDescuento decimal(18,2),
		ROWNUMBER int
	)

	declare @tempPrestacion as table (
		IDTipoPrestacionDetalle int,
		IDTipoPrestacion int,
		TipoPrestacion varchar(255),
		Antiguiedad int,
		DiasAguinaldo int,
		DiasVacaciones int,
		PrimaVacaciones decimal(18,4),
		PorcentajeExtra decimal(18,4),
		DiasExtras int,
		Factor decimal(18,4)
)

	insert @tempSalarioMinimoActual
	exec [Nomina].[spBuscarSalariosMinimosActual]

	declare 
		@IDEmpleado int,
		@ClaveEmpleado varchar(20),
		@SalarioDiario decimal(18,2),
		@SalarioIntegrado decimal(18,2),
		@IDTipoPrestacion int, 
		@FechaAntiguedad date,
		@FechaIngreso date,
		@SalarioMinimo decimal(18,2),
		@UMA decimal(18,2),
		@Factor decimal(18,4),
		@UltimaVariable decimal(18,2),
		@IDMovAfiliatorio int
	;

	select top 1 @UMA = UMA from @tempSalarioMinimoActual

	select @ClaveEmpleado = min(ClaveEmpleado)
	from ImportacionDeSalarios

	while exists (select top 1 1 
				from ImportacionDeSalarios
				where ClaveEmpleado >= @ClaveEmpleado
				)
	begin
		select @SalarioDiario = Sueldo
		from ImportacionDeSalarios
		where ClaveEmpleado = @ClaveEmpleado 

		print @ClaveEmpleado+' - '+cast(@SalarioDiario as varchar(20))

		select 
			@IDEmpleado = IDEmpleado,
			@IDTipoPrestacion = IDTipoPrestacion,
			@FechaAntiguedad = FechaAntiguedad,
			@FechaIngreso = FechaIngreso
		from RH.tblEmpleadosMaster
		where ClaveEmpleado = @ClaveEmpleado

		delete @tempPrestacion	

		insert @tempPrestacion
		exec [RH].[spBuscarCatTiposPrestacionesDetallePorFecha] @IDTipoPrestacion,@FechaAntiguedad,@FechaIngreso

		select top 1 @Factor = Factor from @tempPrestacion

		select top 1 @UltimaVariable = SalarioVariable
		from IMSS.tblMovAfiliatorios
		where IDEmpleado = @IDEmpleado
		order by Fecha desc

		set @SalarioIntegrado = @SalarioDiario * @Factor + @UltimaVariable;

        if ((@UltimaVariable >= (@UMA * 25)) and (@UMA > 0)) 
		begin
            set @SalarioIntegrado = @UMA * 25
        end

		--select *,@SalarioIntegrado as Integrado, @UltimaVariable as Variable
		--from ImportacionDeSalarios
		--where ClaveEmpleado = @ClaveEmpleado 

		exec [IMSS].[spUIMovAfiliatorio]
			@IDMovAfiliatorio = 0
			,@Fecha = '2021-01-16'
			,@IDEmpleado = @IDEmpleado
			,@IDTipoMovimiento = 4
			,@FechaIMSS = null
			,@FechaIDSE	= null
			,@IDRazonMovimiento = null
			,@SalarioDiario = @SalarioDiario
			,@SalarioIntegrado = @SalarioIntegrado
			,@SalarioVariable = @UltimaVariable
			,@SalarioDiarioReal = 0
			,@IDRegPatronal = 1
			,@RespetarAntiguedad = 1
			,@IDUsuario = 1

		select @IDMovAfiliatorio = max(IDMovAfiliatorio)
		from IMSS.tblMovAfiliatorios
		where IDEmpleado = @IDEmpleado

		update ImportacionDeSalarios
			set IDMovAfiliatorio = @IDMovAfiliatorio
		where ClaveEmpleado = @ClaveEmpleado

		select @ClaveEmpleado = min(ClaveEmpleado)
		from ImportacionDeSalarios
		where ClaveEmpleado > @ClaveEmpleado
	end

	--select *
	--from IMSS.tblCatTipoMovimientos

	--select * from IMSS.tblCatRazonesMovAfiliatorios