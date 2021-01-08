BEGIN -- Sucursales
	/* 
		select * from RH.tblCatSucursales
		select * from SUCURSAL
	*/

	insert [RH].[tblCatSucursales](
		Codigo
		,Descripcion
		,CuentaContable
		,Calle
		,Exterior
		,Interior
		,IDColonia
		,IDMunicipio
		,IDEstado
		,IDPais
		,Telefono
		,Responsable
		,Email
		,IDCodigoPostal
		,ClaveEstablecimiento
		,IDEstadoSTPS
		,IDMunicipioSTPS)
	select
		CLAVE_SUCURSAL
		,s.DESCRIPCION
		,CUENTA
		,Calle
		,null as Exterior
		,Numero
		,colonia.IDColonia
		,municipio.IDMunicipio
		,estado.IDEstado
		,151
		,TELEFONO1
		,null
		,null
		,cp.IDCodigoPostal
		,null
		,null
		,null
		
	from SUCURSAL s
		left join SAT.tblCatEstados estado on estado.NombreEstado like '%'+ s.ESTADO +'%' and estado.IDPais = 151
		left join SAT.tblCatMunicipios municipio on municipio.Descripcion like '%'+ s.MUNICIPIO +'%'  and municipio.IDEstado = estado.IDEstado
		left join SAT.tblCatCodigosPostales cp on cp.CodigoPostal = s.CP and cp.IDEstado = estado.IDEstado and cp.IDMunicipio = municipio.IDMunicipio
		left join SAT.tblCatColonias colonia on colonia.NombreAsentamiento like '%'+ s.COLONIA +'%'  and colonia.IDCodigoPostal = cp.IDCodigoPostal

END