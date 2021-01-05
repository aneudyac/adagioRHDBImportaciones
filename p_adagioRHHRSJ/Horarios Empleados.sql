



--select *
--from p_adagioRHHRSJ.Asistencia.tblHorariosEmpleados

--insert p_adagioRHHRSJ.Asistencia.tblHorariosEmpleados(IDEmpleado, IDHorario, Fecha)
--select e.IDEmpleado,ch.IDHorario, hh.FECHA_HORARIO
--from tblHistorialHorarios hh	
--	join p_adagioRHHRSJ.Asistencia.tblCatHorarios ch on replace(hh.ID_HORARIO,' ','') collate SQL_Latin1_General_CP1_CI_AI  = ch.Codigo
--	join p_adagioRHHRSJ.RH.tblEmpleados e on e.ClaveEmpleado = hh.ID_EMPLEADO collate SQL_Latin1_General_CP1_CI_AI  
--where e.IDEmpleado is null

--	select 2476408 - 2466933


--	select * from tblEmpleados where ID_EMPLEADO = '90012'
-- 9475