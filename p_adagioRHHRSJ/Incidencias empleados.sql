

select 
	IDEmpleado
	,IDIncidencia
	,Fecha
	,TiempoSugerido
	,TiempoAutorizado
	,Comentario
	,CreadoPorIDUsuario
	,Autorizado
	,AutorizadoPor
	,FechaHoraAutorizacion
	,FechaHoraCreacion
	,IDIncapacidadEmpleado
	,ComentarioTextoPlano
	--,TiempoExtraDecimal
	,HorarioAD
	,IDHorario
	,Entrada
	,Salida
--	,TiempoTrabajado
from  p_adagioRHHRSJ.Asistencia.tblIncidenciaEmpleado


insert  p_adagioRHHRSJ.Asistencia.tblIncidenciaEmpleado(
	IDEmpleado
	,IDIncidencia
	,Fecha
	,TiempoSugerido
	,TiempoAutorizado
	,Comentario
	,CreadoPorIDUsuario
	,Autorizado
	,AutorizadoPor
	,FechaHoraAutorizacion
	,FechaHoraCreacion
	,IDIncapacidadEmpleado
	,ComentarioTextoPlano
	,HorarioAD
	,IDHorario
	,Entrada
	,Salida
)

select 
		IDEmpleado
	,IDIncidencia
	,Fecha
	,TiempoSugerido
	,TiempoAutorizado
	,Comentario
	,CreadoPorIDUsuario
	,Autorizado
	,AutorizadoPor
	,FechaHoraAutorizacion
	,FechaHoraCreacion
	,IDIncapacidadEmpleado
	,ComentarioTextoPlano
	,HorarioAD
	,IDHorario
	,Entrada
	,Salida
from (
	select 
		e.IDEmpleado
		,ei.ID_INCIDENCIA as IDIncidencia
		,ei.FECHA_INCIDENCIA as Fecha
		,ei.TIEMPO_SUGERIDO as TiempoSugerido
		,ei.TIEMPO_AUTORIZADO as TiempoAutorizado
		,ei.OBSERVACION as Comentario
		,1 as CreadoPorIDUsuario
		,Autorizado = case when ei.PAGAR = 'S' then 1 else 0 end
		,1 as AutorizadoPor
		,FechaHoraAutorizacion =  case when ei.FECHA_AUTORIZACION is null then getdate() else ei.FECHA_AUTORIZACION end
		,FechaHoraCreacion =  case when ei.FECHAREG is null then getdate() else ei.FECHAREG end
		,null as IDIncapacidadEmpleado
		,ei.OBSERVACION as ComentarioTextoPlano
		,ei.HORARIO_AD as HorarioAD
		,ch.IDHorario
		,ei.H_ENTRADA as Entrada
		,ei.H_SALIDA as Salida
		,ROW_NUMBER()OVER(partition by e.IDEmpleado, ei.FECHA_INCIDENCIA, ei.ID_INCIDENCIA, ei.HORARIO_AD order by e.IDEmpleado, ei.FECHA_INCIDENCIA, ei.ID_INCIDENCIA, ei.HORARIO_AD) as [ROW]
	from tblEmpleadoIncidencias ei
		join p_adagioRHHRSJ.RH.tblEmpleados e on e.ClaveEmpleado = ei.ID_EMPLEADO collate SQL_Latin1_General_CP1_CI_AI  
		left join p_adagioRHHRSJ.Asistencia.tblCatHorarios ch on replace(ei.ID_HORARIO,' ','') collate SQL_Latin1_General_CP1_CI_AI  = ch.Codigo
	)as t
where t.[ROW] = 1

