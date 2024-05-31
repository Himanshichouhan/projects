
create database joinq;
use joinq;
create table sailors(sid int,sname varchar(20),rating tinyint,age int); 

insert into sailors(sid,sname,rating,age) values 
(22,"Dustin",7,45),(29,"Brutus",1,33),(31,"Lubber",8,25),(32,"Andy",8,25),(58,"Rusty",10,35),(64,"Horatio",7,35),(71,"Zobra",10,16),(74,"Horatio",9,35),( 85, "Art",3 , 25 ),
( 95, "Bob",3,63);
select * from sailors;

create table reserves(sid int,bid int,dat date);
alter table reserves rename column dat to day;
insert into reserves values
(22,101,"1998-10-10"),(22,102,"1998-10-10"),(22,103,"1998-10-08"),(22,104,"1998-10-07"),(31,102,"1998-10-10"),(31,103,"1998-10-06"),(31,104,"1998-10-12"),(64,101,"1998-09-05"),(64,102,"1998-09-08"),(74,103,"1998-09-08");

select * from reserves;
create table boats(bid int, bname varchar(10),color varchar(10));
insert into boats values (101,"Interlake","blue"),(102,"Interlake","red"),(103,"Clipper","green"),(104,"Marine","red");
select * from boats;
select * from reserves;
select * from sailors;

#Question -1 Find the names of sailors who have  reserved boat 103? 
select sname from sailors S
inner join reserves R on S.sid=R.sid
where bid=103;

#Question-2 Find the colors of boats reserved by  Lubber? 
select * from boats;
select * from reserves;
select * from sailors;

select color from sailors S
inner join reserves R on S.sid=R.sid
inner join boats B on R.bid=B.bid
where sname="Lubber";

#Question -3 Find the names of sailors who have  reserved a red or a green boat?
select distinct sname from sailors S 
inner join reserves R on S.sid=R.sid
inner join boats B on R.bid=B.bid
where color in ("red","green");

#Question-4 Find the sids of sailors with age over 20 who have not reserved a red boat?
select S.sid from sailors S
inner join reserves R on S.sid=R.sid
inner join boats B on R.bid=B.bid
where age > 20 and color not in ("red");
use joinq;
#Question-5 Find the ages of sailors whose name  begins and ends with B and has at least three  characters ? 
select * from boats;
select * from reserves ;
select * from sailors;

select age,sname from sailors
where sname like "b%b"
AND LENGTH(sname) >= 3;


#Question-6 For each red boat, find the number of  reservations for this boat?
select count(*) from reserves R 
inner join boats B on R.bid=B.bid
where color="red";
