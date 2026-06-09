-- ////////    MINI   PROJECT  STUDENT  DATABASE   MANAGEMENT   SYSTEM    \\\\\\\\\\\

create database studentManagementDb;  -- creating database
use studentManagementDb;

drop database studentManagementDb;  -- for deleting the whole structure
-- // creating tables 
create table students(           
student_id int primary key auto_increment,
student_name varchar(50),
student_gender enum("M","F"),
student_contact varchar(40),
student_email  varchar(60)
);

create table subjects(
sub_id int primary key auto_increment,
sub_name varchar(50)
);

create table marks(
mark_id int primary key auto_increment,
student_id int,
sub_id int,
marks int,
foreign key(student_id) references students(student_id),
foreign key(sub_id) references subjects(sub_id)
);

DELIMITER $$
create procedure addstudent(student_name varchar(50),
student_gender enum("M","F"),
student_contact varchar(40),
student_email  varchar(60)
)
begin
    insert into students(student_name,student_gender,student_contact,student_email) values
    (student_name,student_gender,student_contact,student_email);
end $$
DELIMITER ;

call addstudent("preeti","F","9756785757","preeti@gmail.com");
select* from students;
insert into subjects(sub_name)values("maths"),("science"),("english");

insert into marks(student_id,sub_id,marks)values(1,1,94),(1,2,90),(1,3,99);
select* from marks;
insert into marks(student_id,sub_id,marks)values(2,1,91),(2,2,88),(2,3,71);
insert into marks(student_id,sub_id,marks)values(3,1,90),(3,2,91),(3,3,81);
insert into marks(student_id,sub_id,marks)values(4,1,71),(4,2,72),(4,3,73);

select M.mark_id,M.marks,S.sub_name,ST.student_name from marks M
join subjects S on M.sub_id=S.sub_id 
join students ST on M.student_id=ST.student_id
 order by mark_id;
 
select 
S.student_id,
S.student_name,
sum(M.marks) as sum,avg (M.marks) as avgvalue
from students S join marks m on S.student_id=M.student_id
group by S.student_id,s.student_name order by sum ASC;
 
 

