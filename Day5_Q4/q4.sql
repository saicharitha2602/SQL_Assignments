use oct28;

CREATE TABLE student(
s_id INT PRIMARY KEY,
s_name varchar(20),
Course_name varchar(50),
marks INT)

insert into student values(1001,'Charitha','Phys',80)
insert into student values(1002,'Charitha','Chem',70)
insert into student values(1004,'Charitha','Maths',60)
insert into student values(1005,'Charitha','Eng',55)


insert into student values(1006,'yasaswi','Phys',60)
insert into student values(1007,'yasaswi','Chem',80)
insert into student values(1008,'yasaswi','Maths',90)
insert into student values(1009,'yasaswi','Eng',65)

insert into student values(1010,'latha','Phys',78)
insert into student values(1011,'latha','Chem',85)
insert into student values(1012,'latha','Maths',90)
insert into student values(1013,'latha','Eng',60)


insert into student values(1014,'priya','Phys',68)
insert into student values(1015,'priya','Chem',75)
insert into student values(1016,'priya','Maths',95)
insert into student values(1017,'priya','Eng',65)

CREATE OR ALTER PROCEDURE p1 @t_mark INT AS 
BEGIN
SELECT s_name, SUM(marks) AS s_total from student group by s_name having  SUM(marks) <@t_mark
END



CREATE OR ALTER PROCEDURE p2 @d_s_name varchar(20) AS
BEGIN
DECLARE @total_marks AS INT
SELECT  @total_marks= SUM(marks)  from student group by s_name having s_name =@d_s_name;
EXEC p1 @total_marks
END