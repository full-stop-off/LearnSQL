select name from sys.tables;

-- deferent table 
-- taking it own + reflexcive 
create table Employee(
	empId int, 
	empName nvarchar(40) not null,
	emAddress nvarchar(30) default('Itahari'),
	joinDate date default getdate(), --> default clause implementation -> auto set >  system timeddate
	salary decimal(12,2) check (salary between 1000 and 50000), --> conditional check
	managerId int,  ---> nullable type value
	primary key (empId),
	foreign key (managerID) references Employee(empID))
;

insert into Employee(empID, empName, emAddress,salary) values (1,"aarav","biratnagar",5000);
insert into Employee(empID, empName,salary,managerID) values (2,"bikash",5000,1);


--> write a query to list hte name of employee and their manager

select empName,managerId from Employee;