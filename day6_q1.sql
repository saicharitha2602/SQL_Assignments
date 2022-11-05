create database nov1;
use nov1;

CREATE TABLE sales(
s_id INT PRIMARY KEY,
s_name varchar(20),
amount BIGINT,
city varchar(20)
)

insert into sales values (1,'Charitha',5000,'Hyderabad')
insert into sales values (2,'Yasaswi',4000,'Delhi')
insert into sales values (3,'Latha',2000,'Chennai')
insert into sales values (4,'Yomitha',5500,'Bangalore')
insert into sales values (5,'Mohana',7000,'Chennai')

insert into sales values (6,'Bharathi',4000,'Bangalore')
insert into sales values (7,'Priya',3500,'Delhi')
insert into sales values (8,'Harika',3000,'Delhi')
insert into sales values (9,'Vidya',6000,'Hyderabad')
insert into sales values (10,'Swarna',4500,'Hyderabad')



CREATE OR ALTER FUNCTION sales_values(@val varchar(20))
RETURNS TABLE AS
RETURN
select city ,amount   from sales group by city,amount having city = @val


CREATE OR ALTER FUNCTION maxValue(@city_name varchar(20))
RETURNS @ans TABLE (amount BIGINT) AS
BEGIN

DECLARE @res TABLE (city varchar(20),Amount BIGINT)
insert into @res SELECT * FROM sales_values(@city_name)

insert into @ans SELECT AVG(Amount) from @res

 return 

END

SELECT* from maxValue('Delhi')