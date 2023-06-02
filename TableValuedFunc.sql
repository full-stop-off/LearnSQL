-- create table-valued function that rturns a table as return value.
create function getEmpDetail (@salary as decimal) returns Table as
return select * from Employee where empSalary=@salary;

--use the table valued function as parameterized view
select * from dbo.getEmpDetail(1000);

--concept of table variable
declare @myTable Table (id integer, eName nvarchar(40));
insert into @myTable select empid, empName from Employee;

create function getNameList() returns @nameList Table(empName nvarchar(50)) as
begin
	insert into @nameList select empName from Employee;
	return;
end
select * from dbo.getNameList();

drop function dbo.getNameList();
