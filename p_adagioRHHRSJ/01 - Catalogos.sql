


--select * from p_adagioRHHRSJ.RH.tblCatSucursales

--select *
--from SUCURSAL


--select * from p_adagioRHHRSJ.RH.tblCatTiposPrestaciones

--select 
--	IDTipoPrestacion
--	, Antiguedad
--	, DiasAguinaldo
--	, DiasVacaciones
--	, PrimaVacacional
--	, PorcentajeExtra
--	, DiasExtras
--	, Factor
--from p_adagioRHHRSJ.RH.tblCatTiposPrestacionesDetalle


--update p_adagioRHHRSJ.RH.tblCatTiposPrestacionesDetalle
--set DiasAguinaldo = 20

--insert p_adagioRHHRSJ.RH.tblCatTiposPrestacionesDetalle(
--IDTipoPrestacion
--	, Antiguedad
--	, DiasAguinaldo
--	, DiasVacaciones
--	, PrimaVacacional
--	, PorcentajeExtra
--	, DiasExtras
--	--, Factor
--)
--select 
--	2 as IDTipoPrestacion
--	,ANTIGUEDAD
--	,DIAS_AGUI
--	,DIAS_VAC
--	,PRIMA_VACACIONAL/100.00 as PRIMA_VACACIONAL
--	,isnull(P_EXTRAS	,0.0000) as P_EXTRAS
--	,isnull(P_EXTRA_DIA ,0.0000) as P_EXTRA_DIA
--	,FACTOR_INTEGRACION
--from [dbo].[Factor] where Clave_factores = 'CA'

--select * from [dbo].[FACTORES]

--select * from p_adagioRHHRSJ.RH.tblCatPuestos

--insert p_adagioRHHRSJ.RH.tblCatPuestos(Codigo, Descripcion, SueldoBase)
--select CLAVE_PUESTO, descripcion, isnull(SUELDO, 0)
--from PUESTO

--select * from p_adagioRHHRSJ.RH.tblCatDepartamentos

--insert p_adagioRHHRSJ.RH.tblCatDepartamentos(Codigo, Descripcion, CuentaContable)
--select CLAVE_DEPARTAMENTO, descripcion, CUENTA 
--from Departam


----select * from p_adagioRHHRSJ.RH.tblCatCentroCosto

--insert p_adagioRHHRSJ.RH.tblCatCentroCosto(Codigo,Descripcion)
--select CLAVE_CENTR_COSTO, descripcion from [CENTCOST]
