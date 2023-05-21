create database reflect;
use reflect;

select name from sys.tables;

--> deferent table 
--> taking it own + reflexcive 
create table Employee(
	empId int, 
	empName nvarchar(40) not null,
	emAddress nvarchar(30) default('Itahari'),
	joinDate date default getdate(), --> default clause implementation -> auto set ->  system timeddate
	salary decimal(12,2) check (salary between 1000 and 50000), --> conditional check
	managerId int,  ---> nullable type value
	primary key (empId),
	foreign key (managerID) references Employee(empID))
;
insert into Employee(empID, empName, emAddress,salary) values (1,'aarav','biratnagar',5000);
insert into Employee(empID, empName,salary,managerID) values (2,'bikash',5000,1);
insert into Employee(empID, empName,salary,managerID,joinDate) values (3,'shyam',1200,1,'2021-02-29');

insert into Employee(empID, empName,salary,managerID) values (4,'gopal',3200,null);

--> dupicating  -> rename, inner join, other [technique]
select * from Employee as emp, Employee as mgr where emp.managerId=mgr.empId; --> rename technique
select emp.empName,mgr.empName from Employee as emp left join Employee as mgr on emp.managerId=mgr.empId; --> inner method
select emp.empId,mgr.empName from Employee as emp, Employee as mgr where emp.managerId=mgr.empId;
select empname,(select empName from Employee where empId=emp.ManagerId) as mangerName from Employee as emp;

--> write a query to list hte name of employee and their manager
select empName,managerId from Employee;
select * from Employee;

--> counting 
select count(*) from Employee where managerId is null;  --> count

