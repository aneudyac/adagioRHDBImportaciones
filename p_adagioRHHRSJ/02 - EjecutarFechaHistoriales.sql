/*
	alter table trahisde add IDTraHisDe int identity(1,1)
	alter table trahispu add IDTraHisPu int identity(1,1)
	alter table trahissu add IDTraHisSu int identity(1,1)
*/

create proc [dbo].[spActualizarFechasHistorialDepartamento] (@CLAVE_TRABAJADOR varchar(20))
as	
	if OBJECT_ID('tempdb..#tblTempHistorial1') is not null drop table #tblTempHistorial1;  
    if OBJECT_ID('tempdb..#tblTempHistorial2') is not null drop table #tblTempHistorial2;  
  
    select *, ROW_NUMBER()over(order by FECHA_I asc) as [Row]  
    INTO #tblTempHistorial1  
    FROM trahisde
    WHERE CLAVE_TRABAJADOR = @CLAVE_TRABAJADOR  
    order by FECHA_I asc  
  
    select   
		t1.IDTraHisDe  
		,t1.CLAVE_TRABAJADOR  
		,t1.CLAVE_DEPARTAMENTO  
		,t1.FECHA_F  
		,FechaFin = case when t2.FECHA_I is not null then dateadd(day,-1,t2.FECHA_I)   
		else '9999-12-31' end   
    INTO #tblTempHistorial2  
    from #tblTempHistorial1 t1  
		left join (select *   
					from #tblTempHistorial1) t2 on t1.[Row] = (t2.[Row]-1)  
  
    update [TARGET]  
    set   
    [TARGET].FECHA_F = [SOURCE].FechaFin  
    FROM trahisde as [TARGET]  
    join #tblTempHistorial2 as [SOURCE] on [TARGET].IDTraHisDe = [SOURCE].IDTraHisDe  

GO
create proc [dbo].[spActualizarFechasHistorialPuestos] (@CLAVE_TRABAJADOR varchar(20))
as
	if OBJECT_ID('tempdb..#tblTempHistorial1') is not null drop table #tblTempHistorial1;  
    if OBJECT_ID('tempdb..#tblTempHistorial2') is not null drop table #tblTempHistorial2;  
  
    select *, ROW_NUMBER()over(order by FECHA_I asc) as [Row]  
    INTO #tblTempHistorial1  
    FROM Trahispu 
    WHERE CLAVE_TRABAJADOR = @CLAVE_TRABAJADOR  
    order by FECHA_I asc  
  
    select   
		t1.IDTraHisPu  
		,t1.CLAVE_TRABAJADOR  
		,t1.CLAVE_PUESTO  
		,t1.FECHA_F  
		,FechaFin = case when t2.FECHA_I is not null then dateadd(day,-1,t2.FECHA_I)   
		else '9999-12-31' end   
    INTO #tblTempHistorial2  
    from #tblTempHistorial1 t1  
		left join (select *   
					from #tblTempHistorial1) t2 on t1.[Row] = (t2.[Row]-1)  
  
    update [TARGET]  
    set   
    [TARGET].FECHA_F = [SOURCE].FechaFin  
    FROM Trahispu as [TARGET]  
    join #tblTempHistorial2 as [SOURCE] on [TARGET].IDTraHisPu = [SOURCE].IDTraHisPu  
GO
create proc [dbo].[spActualizarFechasHistorialSucursal] (@CLAVE_TRABAJADOR varchar(20))
as
	if OBJECT_ID('tempdb..#tblTempHistorial1') is not null drop table #tblTempHistorial1;  
    if OBJECT_ID('tempdb..#tblTempHistorial2') is not null drop table #tblTempHistorial2;  
  
    select *, ROW_NUMBER()over(order by FECHA_I asc) as [Row]  
    INTO #tblTempHistorial1  
    FROM trahissu
    WHERE CLAVE_TRABAJADOR = @CLAVE_TRABAJADOR  
    order by FECHA_I asc  
  
    select   
		t1.IDTraHisSu  
		,t1.CLAVE_TRABAJADOR  
		,t1.CLAVE_SUCURSAL  
		,t1.FECHA_F  
		,FechaFin = case when t2.FECHA_I is not null then dateadd(day,-1,t2.FECHA_I)   
		else '9999-12-31' end   
    INTO #tblTempHistorial2  
    from #tblTempHistorial1 t1  
		left join (select *   
					from #tblTempHistorial1) t2 on t1.[Row] = (t2.[Row]-1)  
  
    update [TARGET]  
    set   
    [TARGET].FECHA_F = [SOURCE].FechaFin  
    FROM trahissu as [TARGET]  
    join #tblTempHistorial2 as [SOURCE] on [TARGET].IDTraHisSu = [SOURCE].IDTraHisSu 

GO
	declare 
		@CLAVE_TRABAJADOR VARCHAR(20)

	select @CLAVE_TRABAJADOR = min(CLAVE_TRABAJADOR) from trabajad

	while exists (select top 1 1 from trabajad where CLAVE_TRABAJADOR >= @CLAVE_TRABAJADOR)
	begin
		--print @CLAVE_TRABAJADOR
		exec spActualizarFechasHistorialPuestos @CLAVE_TRABAJADOR
		exec [spActualizarFechasHistorialDepartamento] @CLAVE_TRABAJADOR
		exec [spActualizarFechasHistorialSucursal] @CLAVE_TRABAJADOR
		select @CLAVE_TRABAJADOR = min(CLAVE_TRABAJADOR) from trabajad  where CLAVE_TRABAJADOR > @CLAVE_TRABAJADOR
	end;