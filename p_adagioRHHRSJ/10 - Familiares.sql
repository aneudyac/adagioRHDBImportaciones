



select *
from trabajad

select *
from RH.TblCatParentescos


BEGIN -- PADRES
	insert RH.TblFamiliaresBenificiariosEmpleados(IDEmpleado,IDParentesco,NombreCompleto,FechaNacimiento,Sexo,TelefonoMovil,Emergencia,Beneficiario,Dependiente)
	select  e.IDEmpleado
			,1 as IDParentesco
			,t.PADRE as NombreCompleto  
			,null as FechaNacimiento
			,'F' as Sexo
			,null TelefonoMovil
			,0 as Emergencia
			,0 Beneficiario
			,0 Dependiente
		--	,e.ClaveEmpleado
	from trabajad t
		join RH.tblEmpleadosMaster e on t.CLAVE_TRABAJADOR = e.ClaveEmpleado
	where t.PADRE is not null
END

BEGIN -- MADRES
	insert RH.TblFamiliaresBenificiariosEmpleados(IDEmpleado,IDParentesco,NombreCompleto,FechaNacimiento,Sexo,TelefonoMovil,Emergencia,Beneficiario,Dependiente)
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
		join RH.tblEmpleadosMaster e on t.CLAVE_TRABAJADOR = e.ClaveEmpleado
	where t.MADRE is not null
END

