
if object_id('tempdb..#tempmails')
	is not null drop table #tempmails;

create table #tempmails(
	Cuenta varchar(20),
	email varchar(255)
)

insert #tempmails
values
	('04300','recursos.humanos@hrsj.com.mx') -- Yoseline Guadalupe Hernández Flores
	,('02394','brenda.lopez@hrsj.com.mx')
	,('03470','montserrat.alberdi@hrsj.com.mx')
	,('02743','rafael.torresm@hrsj.com.mx')
	,('03100','liz.navarro@hrsj.com.mx')
	,('03849','reclutamiento@hrsj.com.mx') 


update u 
	set u.Email = t.email
		,Activo = 1
from #tempmails t
	join p_adagioRHHRSJ.Seguridad.tblUsuarios u on u.Cuenta = t.Cuenta collate SQL_Latin1_General_CP1_CI_AI

	

