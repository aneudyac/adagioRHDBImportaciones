
--delete RH.tblDepartamentoEmpleado
--delete RH.tblSucursalEmpleado
--delete RH.tblPuestoEmpleado

--DBCC CHECKIDENT ('RH.tblDepartamentoEmpleado', RESEED, 0);
--DBCC CHECKIDENT ('RH.tblSucursalEmpleado', RESEED, 0);
--DBCC CHECKIDENT ('RH.tblPuestoEmpleado', RESEED, 0);



/*
==============================================================
=====													======
=====													======
=====			 Historial Puestos						======
=====													======
=====													======
==============================================================
*/

--select * from puesto
--select * from p_adagioRHHRSJ.RH.tblcatPuestos

--select * from p_adagioRHHRSJ.RH.tblPuestoEmpleado



insert p_adagioRHHRSJ.RH.tblPuestoEmpleado
select e.IDEmpleado,cd.IDPuesto,cast(t.FECHA_I as date) as FechaIni, cast(t.FECHA_F as date) as FechaFin
from trahispu t
	left join p_adagioRHHRSJ.RH.tblEmpleados e on e.ClaveEmpleado = t.CLAVE_TRABAJADOR 
	left join p_adagioRHHRSJ.RH.tblcatPuestos cd on cd.Codigo = t.CLAVE_PUESTO 





/*
==============================================================
=====													======
=====													======
=====			 Historial Sucursales					======
=====													======
=====													======
==============================================================
*/

--select * from sucursal
--select * from p_adagioRHHRSJ.RH.tblcatSucursales

--select * from p_adagioRHHRSJ.RH.tblSucursalEmpleado



--insert p_adagioRHHRSJ.RH.tblSucursalEmpleado
--select e.IDEmpleado,cd.IDSucursal,cast(t.FECHA_I as date) as FechaIni, cast(t.FECHA_F as date) as FechaFin
--from trahissu t
--	left join p_adagioRHHRSJ.RH.tblEmpleados e on e.ClaveEmpleado = t.CLAVE_TRABAJADOR 
--	left join p_adagioRHHRSJ.RH.tblcatSucursales cd on cd.Codigo = t.CLAVE_SUCURSAL 



/*
==============================================================
=====													======
=====													======
=====			 Historial Departamentos				======
=====													======
=====													======
==============================================================
*/

--select * from departam
--select * from p_adagioRHHRSJ.RH.tblCatDepartamentos

--select * from p_adagioRHHRSJ.RH.tblDepartamentoEmpleado


--insert p_adagioRHHRSJ.RH.tblDepartamentoEmpleado
--select e.IDEmpleado,cd.IDDepartamento,cast(t.FECHA_I as date) as FechaIni, cast(t.FECHA_F as date) as FechaFin
--from trahisde t
--	left join p_adagioRHHRSJ.RH.tblEmpleados e on e.ClaveEmpleado = t.CLAVE_TRABAJADOR 
--	left join p_adagioRHHRSJ.RH.tblCatDepartamentos cd on cd.Codigo = t.CLAVE_DEPARTAMENTO 

