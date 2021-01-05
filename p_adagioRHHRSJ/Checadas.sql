



select *
from p_adagioRHHRSJ.Asistencia.tblChecadas

insert p_adagioRHHRSJ.Asistencia.tblChecadas(Fecha, FechaOrigen, IDLector, IDEmpleado,IDTipoChecada,IDUsuario, Comentario,Automatica,FechaOriginal)
select 
	c.Fecha,
	c.FECHA_ORIGEN as FechaOrigen,
	l.IDLector,
	e.IDEmpleado,
	ENTRADA_SALIDA as IDTipoChecada,
	1 as IDUsuario,
	c.COMENTARIOS as Comentario,
	Automatica = case when c.AUTOMATICA = 'N' then 0 else 1 end,
	FechaOriginal = case when FECHA_ORIGINAL is null then c.Fecha else FECHA_ORIGINAL end
from tblChecadas c
	join p_adagioRHHRSJ.RH.tblEmpleados e on e.ClaveEmpleado = c.ID_EMPLEADO collate SQL_Latin1_General_CP1_CI_AI  
	join p_adagioRHHRSJ.Asistencia.tblLectores l on l.CodigoLector = c.ID_LECTOR collate SQL_Latin1_General_CP1_CI_AI  


	-- 2,422,834
	-- 2,415,006