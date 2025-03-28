------------------------------------------------------------------------------------------------
/*******FernandoRivas*****************/
/*******http://dbamex.blogspot.com*****/
declare @bases varchar(600)
declare @file varchar(4000)
/* declaracion del cursor que contendra los datos*/
declare nbase cursor for
select name from master..sysdatabases where name not in ('master', 'model', 'msdb', 'pubs', 'northwind', 'tempdb')
/* abrir el cursor*/
open nbase
/*obtener la primer fila del cursor y agregarle el valor a la variable*/
fetch next from nbase into @bases
/*condicion loop a travez de las filas del cursor*/
while @@fetch_status = 0
begin
select @file = 'c:\respaldos\'+ @bases + CONVERT(CHAR(6), GETDATE(), 112) +'.bak '
backup database @bases to disk = @file with init
/*obtiene la siguiente fila del cursor y la pone en una variable*/
 
fetch next from nbase into @bases end
/*cierra el cursor*/
close nbase
deallocate nbase