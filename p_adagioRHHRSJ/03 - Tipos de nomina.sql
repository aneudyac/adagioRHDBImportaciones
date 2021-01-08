
-- select * from RH.tblCatClientes
select * from Sat.tblCatPeriodicidadesPago

select * from Nomina.tblCatTipoNomina

insert Nomina.tblCatTipoNomina(Descripcion,IDPeriodicidadPago,IDCliente)
select DESCRIPCION, case when c_PeriodicidadPago = '02' then 2 else 3 end, 1 as IDCliente
from tiponomi


select * from tiponomi
select * from trabajad