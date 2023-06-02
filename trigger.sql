-- trigger -> act on the particular events 
      

create or alter trigger notifyInsert on Employee after insert as
begin
	declare @name as nvarchar(50);
	select @name=empName from inserted
	print 'congratulations! New employee inserted with name' + empName
end

exec addEmployee 'jerry',2900,'Dharan';
select name from sys.triggers;
