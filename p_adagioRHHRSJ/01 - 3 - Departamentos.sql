select * from RH.tblCatDepartamentos

insert RH.tblCatDepartamentos(Codigo, Descripcion, CuentaContable)
select CLAVE_DEPARTAMENTO, descripcion, CUENTA 
from Departam