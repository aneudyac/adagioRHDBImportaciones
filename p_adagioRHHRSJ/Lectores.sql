--select * from p_adagioRHHRSJ.RH.tblCatCLientes

select *
from p_adagioRHHRSJ.Asistencia.tblLectores


--select *
--from p_adagioRHHRSJ.Asistencia.tblCatTiposLectores

insert p_adagioRHHRSJ.Asistencia.tblLectores(Lector, CodigoLector, IDTipoLector,[IP],Puerto,Estatus,IDCliente,EsComedor,Comida)
select 
	DESCRIPCION as Lector,
	ID_LECTOR as CodigoLector,
	'ZK' as IDTipoLector,
	[IP],
	Puerto,
	1 Estatus,
	1 as IDCliente,
	0 as EsComedor,
	0 as Comida
from tblLectores 