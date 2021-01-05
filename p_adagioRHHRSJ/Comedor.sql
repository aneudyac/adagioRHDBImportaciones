

--select * from p_adagioRHHRSJ.Comedor.tblCatTiposArticulos

--insert p_adagioRHHRSJ.Comedor.tblCatTiposArticulos(Nombre, Descripcion, Disponible)
--select NOMBRE, DESCRIPCION, case when DISPONIBLE = 'S' then 1 else 0 end
--from [dbo].[TblTipoArticulos]


--select * from p_adagioRHHRSJ.Comedor.tblCatTiposMenus

--insert p_adagioRHHRSJ.Comedor.tblCatTiposMenus(Nombre, Descripcion, HoraDisponibilidadInicio, HoraDisponibilidadFin, Disponible)
--select NOMBRE, DESCRIPCION, DISPONIBILIDAD_INICIO, DISPONIBILIDAD_FIN, case when ACTIVO = 'S' then 1 else 0 end
--from [dbo].[TblTipoMenu]


--select * from p_adagioRHHRSJ.Comedor.tblCatArticulos

--insert p_adagioRHHRSJ.Comedor.tblCatArticulos(IDTipoArticulo, Nombre, Descripcion, PrecioCosto, PrecioEmpleado, PrecioPublico, HoraDisponibilidadInicio, HoraDisponibilidadFin, VentaIndividual, Disponible)
--select cta.IDTipoArticulo, a.Nombre, a.Descripcion, a.PRECIO_COSTO, a.PRECIO_EMPLEADOS, a.PRECIO_PUBLICO, a.DISPONIBILIDAD_INICIO
--, a.DISPONIBILIDAD_FIN, case when a.VENTA_INDIVIDUAL = 'S' then 1 else 0 end, case when a.DISPONIBLE = 'S' then 1 else 0 end
--from tblArticulos a
--	inner join TblTipoArticulos ta on ta.ID_TIPO_ARTICULO = a.ID_TIPO_ARTICULO
--	inner join p_adagioRHHRSJ.Comedor.tblCatTiposArticulos cta on cta.Nombre = ta.NOMBRE collate SQL_Latin1_General_CP1_CI_AI
--order by a.NOMBRE


select tm.Nombre as tipo_menu, *
from TblMenu m
	join TblTipoMenu tm on tm.ID_TIPO_MENU = m.ID_TIPO_MENU