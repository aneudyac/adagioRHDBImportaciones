
select * from RH.tblCatDatosExtra

select *
from RH.tblDatosExtraEmpleados


insert RH.tblDatosExtraEmpleados(IDDatoExtra, Valor, IDEmpleado)
select 3 as IDDatoExtra,CUENTA_VALES, e.IDEmpleado
from [dbo].[TRABEXT] t
	join RH.tblEmpleadosMaster e on e.ClaveEmpleado = t.CLAVE_TRABAJADOR
where CUENTA_VALES is not null

insert RH.tblDatosExtraEmpleados(IDDatoExtra, Valor, IDEmpleado)
select 4 as IDDatoExtra,TARJETA_VALES, e.IDEmpleado
from [dbo].[TRABEXT] t
	join RH.tblEmpleadosMaster e on e.ClaveEmpleado = t.CLAVE_TRABAJADOR
where TARJETA_VALES is not null


select *
from App.tblNotificaciones





select *
from [dbo].[TRABEXT]
where AJUSTE_ANUAL is not null


-- PAGO_REINGRESO
-- FONDO_DE_AHORRO
-- DESCUENTO_COMEDOR
-- NO_PAGAR_INCAPACIDAD
-- NOMBRE_CORTO
-- CUENTA_CONTABLE
-- AJUSTE_ANUAL