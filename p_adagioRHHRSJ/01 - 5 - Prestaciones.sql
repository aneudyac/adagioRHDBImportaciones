



/*
select * from RH.tblCatTiposPrestaciones
select * from [dbo].[FACTORES]
*/


--insert RH.tblCatTiposPrestaciones(Codigo,Descripcion,Sindical)
--select CLAVE_FACTORES, descripcion, case when TIPO = 'SINDICAL' then 1 else 0 end
--from [dbo].[FACTORES]

--delete  RH.tblCatTiposPrestaciones
--delete  RH.tblCatTiposPrestacionesDetalle


--select 
--	IDTipoPrestacion
--	, Antiguedad
--	, DiasAguinaldo
--	, DiasVacaciones
--	, PrimaVacacional
--	, PorcentajeExtra
--	, DiasExtras
--	, Factor
--from RH.tblCatTiposPrestacionesDetalle


--update H.tblCatTiposPrestacionesDetalle
--set DiasAguinaldo = 20

insert RH.tblCatTiposPrestacionesDetalle(
IDTipoPrestacion
	, Antiguedad
	, DiasAguinaldo
	, DiasVacaciones
	, PrimaVacacional
	, PorcentajeExtra
	, DiasExtras
	--, Factor
)
select 
	 ctp.IDTipoPrestacion
	,ANTIGUEDAD
	,DIAS_AGUI
	,DIAS_VAC
	,PRIMA_VACACIONAL/100.00 as PRIMA_VACACIONAL
	,isnull(P_EXTRAS	,0.0000) as P_EXTRAS
	,isnull(P_EXTRA_DIA ,0.0000) as P_EXTRA_DIA
--	,FACTOR_INTEGRACION
from [dbo].[Factor] f
	left join RH.tblCatTiposPrestaciones ctp on ctp.Codigo = f.CLAVE_FACTORES
where ctp.IDTipoPrestacion is not null
order by ctp.IDTipoPrestacion, f.ANTIGUEDAD
--

