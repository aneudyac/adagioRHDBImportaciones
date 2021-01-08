


select * from RH.tblCatRegPatronal

insert into RH.tblCatRegPatronal(RegistroPatronal, RazonSocial,ActividadEconomica, IDCodigoPostal, IDEstado, IDMunicipio, IDColonia, IDPais, Calle, Exterior, Interior, Telefono, RepresentanteLegal, OcupacionRepLegal)
select 
	CLAVE_REGPAT
	,NOMBRE
	,ACTIVIDAD
	,cp.IDCodigoPostal
	,estado.IDEstado
	,municipio.IDMunicipio
	,colonia.IDColonia
	,151 as IDPais
	,CALLE
	,null as Exterior
	,null as Interior
	,Telefono1
	,REP_LEGAL
	,OCUP_REP_LEGAL
from [dbo].[regipatr] r
	left join SAT.tblCatEstados estado on estado.NombreEstado like '%'+ r.ESTADO +'%' and estado.IDPais = 151
	left join SAT.tblCatMunicipios municipio on municipio.Descripcion like '%'+ r.MUNICIPIO +'%'  and municipio.IDEstado = estado.IDEstado
	left join SAT.tblCatCodigosPostales cp on cp.CodigoPostal = r.CP and cp.IDEstado = estado.IDEstado and cp.IDMunicipio = municipio.IDMunicipio
	left join SAT.tblCatColonias colonia on colonia.NombreAsentamiento like '%'+ r.COLONIA +'%'  and colonia.IDCodigoPostal = cp.IDCodigoPostal

select *
from [dbo].[regipatr]