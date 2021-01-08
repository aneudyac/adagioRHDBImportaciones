



select *
from trabajad

select *
from p_adagioRHHRSJ.RH.TblCatParentescos

insert  p_adagioRHHRSJ.RH.TblFamiliaresBenificiariosEmpleados(IDEmpleado,IDParentesco,NombreCompleto,FechaNacimiento,Sexo,TelefonoMovil,Emergencia,Beneficiario,Dependiente)
select  e.IDEmpleado
		,2 as IDParentesco
		,t.MADRE as NombreCompleto  
		,null as FechaNacimiento
		,'F' as Sexo
		,null TelefonoMovil
		,0 as Emergencia
		,0 Beneficiario
		,0 Dependiente
	--	,e.ClaveEmpleado
from trabajad t
	join p_adagioRHHRSJ.RH.tblEmpleadosMaster e on t.CLAVE_TRABAJADOR = e.ClaveEmpleado
where t.MADRE is not null