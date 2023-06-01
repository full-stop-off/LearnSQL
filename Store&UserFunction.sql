-- Implementation of  Store Procedures function | storeing in variable with select | decision making | name listing
-- Implementation of User-Defined function

-- Store procedure is a technique to store a block of sql statement and reuse over and over again.

create database Org;
use Org;

create table Employee(
  	empId int primary key, -- identity(1,1) -> gaps can be seen in auto increment
  	empName nvarchar(50) not null unique
  	empsalary decimal(12,2) default(1000) not null,
  	empAddress nvarchar(50) null
  );
  
create procedure addEmployee(@name as nvarchar(50), @salary as decimal(12,2), @addr as nvarchar(30)='Itahari') as -- default value is set in address
begin
		declare @id as integer;  
		select @id=max(empId) from Employee; -- norecord = null  <-[max] | else max id 
		if @id is null
			begin
				set n@id=1;
			end
		else
			begin
				set @id=@id + 1;
			end
		insert into Employee(EmpId, empName, empSalary, empAddress) values (@id, @name, @salary, @addr);
end
                             
select name from sys.procedures

-- adding 5 employees 
exec addEmployee 'fullstop',1200);
exec addEmployee 'nahamsec',1100 , 'America');
exec addEmployee 'godfatherorwa', 1000, 'San Frans Cisco');
exec addEmployee 'stok', 1400.00, 'Peris');
exec addEmployee 'codingo', 1800.00,'Europe');

select * from employee;


-- User-Define function
-- scalar function - return only one

create function getNextEmpId() returns int as  -- defaut parameter
begin
		insert into Employee(dob.getNextEmpId(), empName, empSalary, empAddress) values (@id, @name, @salary, @addr);
end

select dbo.getNextEmpId() -- default database object| return id value in a table | output -> 5 

exec addEmployee 'tabbai',1900);
exec addEmployee 'todayisnew',1700 , 'London');

select dbo.getNextEmpId() -- output 7 
