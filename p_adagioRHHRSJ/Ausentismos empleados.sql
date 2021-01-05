
insert  p_adagioRHHRSJ.Asistencia.tblIncidenciaEmpleado(
	IDEmpleado
	,IDIncidencia
	,Fecha
	,Comentario
	,CreadoPorIDUsuario
	,Autorizado
	,AutorizadoPor
	,FechaHoraAutorizacion
	,FechaHoraCreacion
	,IDIncapacidadEmpleado
	,ComentarioTextoPlano
)
select IDEmpleado
	,IDIncidencia
	,Fecha
	,Comentario
	,CreadoPorIDUsuario
	,Autorizado
	,AutorizadoPor
	,FechaHoraAutorizacion
	,FechaHoraCreacion
	,IDIncapacidadEmpleado
	,ComentarioTextoPlano
from (
	select 
		e.IDEmpleado
		,ei.ID_INCIDENCIA as IDIncidencia
		,ei.FECHA_INCIDENCIA as Fecha
		,ei.MOTIVO_INCIDENCIA as Comentario
		,1 as CreadoPorIDUsuario
		,1 as Autorizado 
		,1 as AutorizadoPor
		,getdate() as FechaHoraAutorizacion
		,getdate() as FechaHoraCreacion
		,null as IDIncapacidadEmpleado
		,ei.MOTIVO_INCIDENCIA as ComentarioTextoPlano
		,ROW_NUMBER()OVER(partition by ei.ID_EMPLEADO, ei.FECHA_INCIDENCIA, ei.ID_INCIDENCIA, ei.HorarioAD order by ei.ID_EMPLEADO, ei.FECHA_INCIDENCIA, ei.ID_INCIDENCIA, ei.HorarioAD) as [ROW]
	from tblEmpIncidencia ei
		join p_adagioRHHRSJ.RH.tblEmpleados e on e.ClaveEmpleado = ei.ID_EMPLEADO collate SQL_Latin1_General_CP1_CI_AI  
	--	join p_adagioRHHRSJ.Asistencia.tblCatIncidencias ci on ci.IDIncidencia = ei.ID_INCIDENCIA  collate SQL_Latin1_General_CP1_CI_AI  and isnull(ci.EsAusentismo,0) = 1
	where  ei.ID_INCIDENCIA = 'F' --ei.FECHA_INCIDENCIA > '2000-01-01' and ei.ID_INCIDENCIA <> 'I'
) as t 
where t.[ROW] = 1


--alter table tblEmpIncidencia add HorarioAD varchar(10)


--update  tblEmpIncidencia set  HorarioAD = 'DS'