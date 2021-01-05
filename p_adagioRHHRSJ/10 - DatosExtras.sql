
select * from RH.tblCatDatosExtra

select *
from RH.tblDatosExtraEmpleados


insert RH.tblDatosExtraEmpleados(IDDatoExtra, Valor, IDEmpleado)
select 3 as IDDatoExtra,CUENTA_VALES, e.IDEmpleado
from dbRHFlexHRSJ_20201111.[dbo].[TRABEXT] t
	join RH.tblEmpleadosMaster e on e.ClaveEmpleado = t.CLAVE_TRABAJADOR
where CUENTA_VALES is not null

insert RH.tblDatosExtraEmpleados(IDDatoExtra, Valor, IDEmpleado)
select 4 as IDDatoExtra,TARJETA_VALES, e.IDEmpleado
from dbRHFlexHRSJ_20201111.[dbo].[TRABEXT] t
	join RH.tblEmpleadosMaster e on e.ClaveEmpleado = t.CLAVE_TRABAJADOR
where TARJETA_VALES is not null


select *
from App.tblNotificaciones