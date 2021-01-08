
select * from RH.tblCatPuestos

insert RH.tblCatPuestos(Codigo, Descripcion, SueldoBase)
select CLAVE_PUESTO, descripcion, isnull(SUELDO, 0)
from PUESTO