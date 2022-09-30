'''Analyse the data to check if the table is normalized i.e follows all the normal forms, mention all the problems you find and how would you solve it.
If the data is normalized, you can simply create one table with all the 33 columns, but if it is not, you need to see how many tables are to be created.
Feel free to add ID columns as primary keys if you are creating multiple tables.
If you created multiple tables, mention the foreign keys for each table and the candidate keys.
Create an ER diagram to refer to when analysing the database.
Finally, I would like you to add a write up either with each chunk of code or towards the end, about the database created and the steps you had to follow to create it.'''


'''
 normalizing the data: to avoid reductancy in the data .
    1st normal form: 1.Each column must have single value ,it wont accept multiple values in single column.
					2.Identify the primary key of the table.
	       here in the given dataset lati-long has multiple values in single column along with duplicates, so we need elimate that columns.
    
     2nd normal form:it should be in 1nf,primary key shouldnot have functional dependencies.
     
     3rd normal form: should be in 2nf with  no transitive functional dependencies.
     
     if any transitive dependencies are found it got to be decompose into more tables.'''
     
     #creating database is the 1st step.
create database rdbms;
use rdbms;


create table customers( 
customerid varchar(40) primary key,
city varchar(20),
zipcode varchar(50),
gender char(5),
seniorcitizen char(4),
partner varchar(30),
dependents varchar(20));

desc  customers;
insert into customers values('3668-QPYBK','Los Angeles','90003','Male','No','No','No');
insert into customers values('9237-HQITU','Los Angeles','90005','Fem','No','No','yes');
insert into customers values('9305-CDSKC','Los Angeles','90006','Fem','No','No','yes');
insert into customers values('7892-POOKP','Los Angeles','90010','Fem','No','yes','yes');
insert into customers values('0280-XJGEX','Los Angeles','90015','Male','No','No','yes');
insert into customers values('4190-MFLUW','Los Angeles','90020','Fem','No','yes','No');
insert into customers values('8779-QRDMV','Los Angeles','90022','Male','yes','No','No');
insert into customers values('1066-JKSGK','Los Angeles','90024','Male','No','No','No');

select * from customers;



create table state (
state varchar(40),
zipcode varchar(20));
alter table state add foreign key(zipcode) references location (zipcode);

insert into state values('California','90003');
insert into state values('California','90005');
insert into state values('California','90006');
insert into state values('California','90010');
insert into state values('California','90015');
insert into state values('California','90020');
insert into state values('California','90022');
insert into state values('California','90024');
select * from state;
 

create table location(
zipcode varchar(20) primary key,
country varchar(30),
lattitude decimal(10,2),
longitude decimal(10,2),
customerid varchar(40));
desc location;
alter table location add foreign key(customerid) references customers(customerid);




create table city (city varchar(20) primary key,zipcode  varchar(20) );
desc city;
alter table city add foreign key (zipcode) references location (zipcode);

create table churninfo(churnlabel varchar(40),churnvalue int,churnscore int,
cltv decimal(10,2),churnreason varchar(50),customerid varchar(20));
alter table churninfo add foreign key (customerid) references customers(customerid);
desc churninfo;




create table subscription (tenuremonths int,phoneservices varchar(30),onlinesecurity varchar(40),
onlinebackup varchar(20),
deviceprotection varchar(30),
techsupport varchar(10),
streamingtv varchar(20),
customerid varchar(20));
alter table subscription add foreign key(customerid) references customers(customerid);
desc subscription;



create table payments(paymentmethod varchar(15),monthlycharges decimal(10,2),totalcharges decimal(10,2),
tenuremonths int,paperlessbilling varchar(20),customerid varchar(20));
alter table payments add foreign key(customerid) references customers(customerid);

desc payments;
