

select *
from adgHRSJ.dbo.tblEmpleadoIncidencias

select *
from adgHRSJ.dbo.tblEmpIncidencia
 

--select *
--from ausentis a
--	left join adgHRSJ.dbo.tblIncidencias ci on ci.ID_INCIDENCIA  collate SQL_Latin1_General_CP1_CI_AI = a.CLAVE_AUSENTISMO
--	--left join p_adagioRHHRSJ.Asistencia.tblCatIncidencias ci on ci.IDIncidencia = a.CLAVE_AUSENTISMO


--select *
--from ausentis a
--	right join adgHRSJ.dbo.tblIncidencias ci on ci.ID_INCIDENCIA  collate SQL_Latin1_General_CP1_CI_AI = a.CLAVE_AUSENTISMO
--	--right join p_adagioRHHRSJ.Asistencia.tblCatIncidencias ci on ci.IDIncidencia = a.CLAVE_AUSENTISMO

--select *
--from  p_adagioRHHRSJ.Asistencia.tblCatIncidencias a
--	left join adgHRSJ.dbo.tblIncidencias ci on ci.ID_INCIDENCIA  collate SQL_Latin1_General_CP1_CI_AI = a.IDIncidencia
--	--left join p_adagioRHHRSJ.Asistencia.tblCatIncidencias ci on ci.IDIncidencia = a.CLAVE_AUSENTISMO


--insert p_adagioRHHRSJ.Asistencia.tblCatIncidencias(IDIncidencia,Descripcion,EsAusentismo,GoceSueldo,PermiteChecar,AfectaSUA,TiempoIncidencia,Color,Autorizar,GenerarIncidencias)
--select 
--	ci.ID_INCIDENCIA
--	,ci.DESCRIPCION
--	,1 as EsAusentismo
--	,GoceSueldo = case when ci.GOCE_SUELDO = 'S' then 1 else 0 end
--	,PermiteChecar = case when ci.ID_INCIDENCIA = 'O' then 1 else 0 end
--	,0 as AfectaSUA
--	,0 as TiempoIncidencia
--	,'#707070' as Color
--	,Autorizar = case when ci.ID_INCIDENCIA = 'X' then 1 else 0 end
--	,0 GenerarIncidencias
--from p_adagioRHHRSJ.Asistencia.tblCatIncidencias a
--	right join adgHRSJ.dbo.tblIncidencias ci on ci.ID_INCIDENCIA  collate SQL_Latin1_General_CP1_CI_AI = a.IDIncidencia
--	--right join p_adagioRHHRSJ.Asistencia.tblCatIncidencias ci on ci.IDIncidencia = a.CLAVE_AUSENTISMO
--where a.IDIncidencia is null

--select *
--from trabause

--select *
--from trabinca