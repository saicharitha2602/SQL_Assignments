use nov1;

CREATE TABLE Event( 
event_id INT PRIMARY KEY,
Events_name varchar(30),
event_date date,
organizer  varchar(20),
loc varchar(50),
total_cost BIGINT
)


insert into Event values(1,'aniversary','11-04-2022','Charitha','hyderabad',20000)
insert into Event values(2,'conference','10-04-2022','Yasaswi','chennai',30000)
insert into Event values(3,'seminar','05-04-2022','Latha','bangalore',40000)
insert into Event values(4,'party','06-04-2022','Priya','hyderabad',50000)

insert into Event values(5,'aniversary','11-04-2022','Yomitha','bangalore',30000)
insert into Event values(6,'conference','10-04-2022','Bharathi','mumbai',20000)
insert into Event values(7,'seminar','05-04-2022','Vidya','mumbai',50000)
insert into Event values(8,'party','06-04-2022','Harika','chennai',40000)


CREATE OR ALTER PROCEDURE display_events @event_date date AS
BEGIN
SELECT * from Event where event_date = @event_date
END

EXEC display_events '11-04-2022';



CREATE OR ALTER FUNCTION disp_Event()
RETURNS TABLE AS

RETURN 
SELECT count(Events_name) AS numofevents  from Event where total_cost = (select MAX(total_cost) from Event )


select * from disp_Event()


CREATE OR ALTER PROCEDURE display_events @location varchar(50) AS
BEGIN
SELECT * from Event where loc = @location
END


EXEC display_events 'bangalore'