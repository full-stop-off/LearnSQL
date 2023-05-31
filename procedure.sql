create databases student;
use student;
create table Person(
  pid int PRIMARY KEY,
  pName nvarchar(50) not null,
  pAddress nvarchar(40),
  pContactNo nvarchar(10)
);

insert into Person(pid,pName,pAddress,pContactNo) values(1,'fullstop','Itahari','9812345670');

select * from Person;


-- Create procedure - function creation 
create procedure getAllPerson as
begin -- start body
    SELECT * FROM Person;
end -- end body
exec getAllPerson; -- function call 



-- addperson function 
create procedure addPerson(@id as integer, @name as nvarchar(50),@addr as nvarchar(40),@phone as nvarchar(10)) as 
begin
  insert into Person(pid,pName,pAddress,pContactNo) values (@id,@name,@addr,@phone);
  print 'Person Added. ';
end

declare @id as integer -- creating variable with declare keyword

exec addPerson 2, 'fullstop','Itahari','9812345670'; -- 



-- deleteing with the help of procedure method/ function 
create procedure deleteUsers(@id as integer) as 
begin 
  DELETE FROM Person WHERE pid=@id ;
end



-- updating user info 
create procedure updatePerson(@id as integer, @n as nvarchar(50), @addr as nvarchar(40),@phone as nvarchar(10)) as 
begin
  UPDATE Person
    SET pName=@n,pAddress=@addr, pContactNo=@phone)    WHERE pid=@id;
end
exec getAllPerson
exec updatePerson 2,'Gopal','Dharan',null;


exec deleteUsers 1;


-- updating user info with alter and conditional statements 
alter procedure updatePerson(@id as integer, @n as nvarchar(50), @addr as nvarchar(40),@phone as nvarchar(10)) as 
begin
  if (@phone is null)
    begin 
      update Person set pName=@n, pAddress =@addr where pid=@id;
    end 
  else 
    begin
      UPDATE Person    SET pName=@n,pAddress=@addr, pContactNo=@phone    WHERE pid=@id;
    end 
end
exec getAllPerson;
exec updatePerson 2,'Gopal','Dharan'; -- without phone number its also null able types 


create procedure getPersonCount(@count as integer output) as
begin
  declear @count as integer;
  select @count=count(*) from Person;
end 


declare @count as integer 
exec getPersonCount @count output;
print @count;

