
--select * from p_adagioRHHRSJ.Asistencia.tblDetalleGrupoHorario

--insert p_adagioRHHRSJ.Asistencia.tblDetalleGrupoHorario(IDGrupoHorario, IDHorario)
--select 1,IDHorario from p_adagioRHHRSJ.Asistencia.tblCatHorarios

 --select * from p_adagioRHHRSJ.Asistencia.tblCatGruposHorarios
 --select * from p_adagioRHHRSJ.Asistencia.tblCatTurnos


/*
	select IDTurno
		,Codigo
		,Descripcion
		,HoraEntrada
		,HoraSalida
		,TiempoDescanso
		,JornadaLaboral
		,TiempoTotal
		,HoraDescanso
	from p_adagioRHHRSJ.Asistencia.tblCatHorarios

	insert p_adagioRHHRSJ.Asistencia.tblCatHorarios(
		IDTurno
		,Codigo
		,Descripcion
		,HoraEntrada
		,HoraSalida
		,TiempoDescanso
		,JornadaLaboral
		,TiempoTotal
		--,HoraDescanso
	)
	select 
		ID_TURNO
		,replace(ID_HORARIO,' ','')
		,DESCRIPCION
		,ENTRADA_TRABAJO
		,SALIDA_TRABAJO
		,TIEMPO_DESCANSO
		,JORNADA_LABORAL
		,HORAS
		--,ID_GRUPOHORARIO
	from tblHorarios

*/