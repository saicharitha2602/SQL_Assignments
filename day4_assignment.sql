create database oct27;

use oct27;

-- Q1 : Create a Stored Procedure to show only the Employees working on C# in the base location of Bangalore. Display the result set with Employee ID, Name, Working Language and Base Location.
create table employee(emp_id int primary key,emp_name varchar(50) not null,work_language varchar(50) not null ,
location varchar(50) not null);

insert into employee values(123,'Charitha','C#','Bangalore');
insert into employee values(456,'Latha','Java','Hyd');
insert into employee values(789,'Yasaswi','C#','Hyd');
insert into employee values(111,'Priya','Python','Bangalore');
insert into employee values(555,'Bharathi','.NET','Chennai');


CREATE PROCEDURE get_employee
AS
Select emp_id,emp_name,work_language,location from employee where  work_language='C#' and location='Bangalore';

exec get_employee


-- Q2: Create a Stored Procedure to calculate total marks and display ranks of students accordingly. Have atleast 10 students in the result set.Total marks should include marks from Maths, Economics, Commerce, English and Computer Science.

create table student(student_id int primary key, student_name varchar(50) not null,
maths int,economics int,commerce int , english int, computer_science int);

insert into student values(111,'Charitha',45,55,70,85,68);
insert into student values(123,'Yasaswi',56,78,90,45,55);
insert into student values(125,'Lakshmi',79,90,66,54,89);
insert into student values(345,'Mohana',54,88,94,45,37);
insert into student values(555,'Yomitha',78,49,76,49,85);
insert into student values(234,'Latha',68,90,83,66,39);
insert into student values(567,'Bharathi',67,89,46,78,66);
insert into student values(789,'Harika',75,38,88,56,86);
insert into student values(456,'Priya',59,90,63,85,73);
insert into student values(444,'Vidya',59,49,87,48,74);


--SELECT student_id,student_name,
--(maths+economics+commerce+english+computer_science) as Total from student;

CREATE PROCEDURE student_details
AS
SELECT student_id,student_name,(maths+economics+commerce+english+computer_science) as Total,
ROW_NUMBER() OVER(
	ORDER BY (maths+economics+commerce+english+computer_science) DESC
)
AS 'RANK'
FROM student;

exec student_details

-- Q3: 

CREATE TABLE stud_Info(
s_Id INT PRIMARY KEY,
s_Name varchar(20),
s_Age INT,
s_Sex varchar(10),
s_Course varchar(20),
s_Year INT
)


insert into stud_Info values(11,'Charitha',21,'F','ECE',3)
insert into stud_Info values(12,'Lakshmi',20,'F','CSE',2)
insert into stud_Info values(13,'Yasaswi',22,'F','ECE',4)
insert into stud_Info values(14,'Bharathi',19,'F','EEE',1)
insert into stud_Info values(15,'Vidya',19,'F','ECE',1)
insert into stud_Info values(16,'Mohana',20,'F','ME',1)
insert into stud_Info values(17,'Yomitha',24,'F','CSE',4)
insert into stud_Info values(18,'Priya',20,'F','CSE',1)
insert into stud_Info values(16,'Harika',22,'F','CE',3)
insert into stud_Info values(17,'Latha',24,'F','ECE',4)



Create or ALTER PROCEDURE p_2 @year INT AS
SELECT * from stud_Info where s_Year=@year


EXEC p_2 @year=3



--Q4: Create a user defined function where you can calculate interest on a savings account with the formula pnr/100. If it is a checking account, calculate the interest as 5% on principal amount.
CREATE function simpleInterest(@Principle BIGINT,@Time INT)
RETURNS BIGINT AS
BEGIN
   DECLARE @Rate AS INT
   SET  @Rate=5
  DECLARE @Result AS BIGINT
  SELECT  @Result = (@Principle*@Rate*@Time)/100
  RETURN @Result
END

SELECT dbo.simpleInterest(65000,5)


--Q5: Create a table that has time from various time zones (US, UK, Dubai, Singapore, etc) Create a UDF where you set the alarm clock to 5 am if the time zone is Dubai, 6 am if it is UK and 7 am if it is any other time zone.

CREATE TABLE time_Zone(
country_code INT PRIMARY KEY,
country_name varchar(20),
)

insert into time_zone values(0010,'US')
insert into time_zone values(0015,'UK')
insert into time_zone values(0020,'Dubai')
insert into time_zone values(0025,'Singapore')

CREATE  or alter FUNCTION timeZone (@c_name varchar(20))
RETURNS varchar(20) AS
BEGIN
DECLARE @res AS varchar(20)
   IF @c_name='Dubai'
    set @res = '5 am'
   ELSE IF @c_name='UK'
     set @res = '6 am'
   ELSE 
   set @res = '7 am'

   RETURN @res
END

select dbo.timeZone('Singapore')