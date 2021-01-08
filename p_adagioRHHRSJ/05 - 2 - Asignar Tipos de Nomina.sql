

select t.CLAVE_TRABAJADOR, t.CLAVE_TIPO_NOMINA, n.*, ctn.DESCRIPCION
	,IDTipoNomina = case when ctn.DESCRIPCION like 'SEMANA%' then 7 else 8 end
from trabajad t
	left join tiponomi n on t.CLAVE_TIPO_NOMINA = n.CLAVE_TIPO_NOMINA
	left join Nomina.tblCatTiponomina ctn on ctn.Descripcion = n.DESCRIPCION
	
update tne
set tne.IDTipoNomina = case when ctn.DESCRIPCION like 'SEMANA%' then 7 else 8 end
from trabajad t
	left join tiponomi n on t.CLAVE_TIPO_NOMINA = n.CLAVE_TIPO_NOMINA
	left join Nomina.tblCatTiponomina ctn on ctn.Descripcion = n.DESCRIPCION
	left join RH.tblEmpleados e on e.ClaveEmpleado = t.CLAVE_TRABAJADOR
	left join RH.tblTipoNominaEmpleado tne on tne.IDEmpleado = e.IDEmpleado

--select *
--from tiponomi

--select *
--from Nomina.tblCatTiponomina


--select *
--from RH.tblTipoNominaEmpleado
--update Nomina.tblCatTiponomina
--set IDCliente = 1