--run it from sqlplus as BLUE
--BLUE should be created as follow:
--
--create user BLUE identified by password account unlock;
--grant connect, resource to BLUE;
--alter user BLUE quota unlimited on users;
--



drop table bill_service;
drop table services;
drop table bills;
drop table moorings;
drop table boats;
drop table history;
drop table users;

drop sequence seq_users;
drop sequence seq_services;
drop sequence seq_boats;
drop sequence seq_moorings;
drop sequence seq_bills;

--creation of tables

create table users(
    user_id integer primary key,
    first_name VARCHAR2(20),
    last_name VARCHAR2(20),
    id_number VARCHAR2(10),
    constraint users_unique unique(id_number));
    
create table services(
    service_id integer primary key,
    service_cost float, --[€]
    service_type VARCHAR2(20));
    
create table boats(
    boat_id integer primary key,
    boat_type VARCHAR2(20),
    boat_length integer, --[meters]
        constraint boat_length_greaterthanzero check (boat_length>0),
    boat_width integer, --[meters]
        constraint boat_width_greaterthanzero check (boat_width>0),
    user_id integer
        constraint user_id_fk references users(user_id)
        constraint user_id_nn not null);
        
create table moorings(
    mooring_id integer primary key,
    mooring_cost float --[€]
        constraint mooring_cost_greaterthanzero check (mooring_cost>0),
    mooring_length integer, --[meters]
        constraint mooring_length_greaterthanzero check (mooring_length>0),
    mooring_width integer, --[meters]
        constraint mooring_width_greaterthanzero check (mooring_width>0),
    boat_id integer
        constraint boat_id_fk references boats(boat_id));        

create table bills(
    bill_id integer primary key,
    bill_date date,
    bill_start_date date,
    bill_end_date date,
    user_id integer
        constraint user_id_fk2 references users(user_id),
    boat_id integer
        constraint boat_id_fk2 references boats(boat_id));        
        
create table bill_service(
    bill_id integer
        constraint bill_id_fk references bills(bill_id),
    service_id integer
        constraint service_id_fk references services(service_id));                

create table history(
    history_date date,
    h_first_name VARCHAR2(20),
    h_last_name VARCHAR2(20),
    h_id_number VARCHAR2(10),
    h_description VARCHAR2(100));
    
create or replace trigger insert_new_user
after insert 
    on users 
    for each row
begin
    insert into history(history_date, h_first_name, h_last_name, h_id_number, h_description)
    values (sysdate, :new.first_name, :new.last_name, :new.id_number, 'New user ');--in mooring: ' || (select mooring_id
    --from moorings where boat_id = (select boat_id from boats where user_id= :new.user_id)) || 'h');
    end insert_new_user;        
/

create or replace trigger delete_user
after delete 
    on users 
    for each row
begin
 insert into history(history_date, h_first_name, h_last_name, h_id_number, h_description)
    values (sysdate, :old.first_name, :old.last_name, :old.id_number, 'Deleted user ');--in mooring: ' || (select mooring_id
    --from moorings where boat_id = (select boat_id from boats where user_id= :new.user_id)) || 'h');
    end delete_user; 

--creation of sequences
select mooring_id
from moorings where boat_id = (select boat_id from boats where user_id=101);

create sequence seq_users start with 101;
create sequence seq_services start with 101;
create sequence seq_boats start with 101;
create sequence seq_moorings start with 101;
create sequence seq_bills start with 101;

--insert of users
insert into users(user_id, first_name, last_name, id_number)
    values(seq_users.nextval, 'Pippo', 'Brutti', 'CA7382oeL');
    
    --delete from users where id_number= 'CA7382oeL';
    
insert into users(user_id, first_name, last_name, id_number)
    values(seq_users.nextval, 'Paolo', 'Riva','CA7763oeL');
    
insert into users(user_id, first_name, last_name, id_number)
    values(seq_users.nextval, 'Edoardo', 'Errani','CA7385feL');
    
insert into users(user_id, first_name, last_name, id_number)
    values(seq_users.nextval, 'Sergio', 'Evangelista','CA4477oeI');
    
insert into users(user_id, first_name, last_name, id_number)
    values(seq_users.nextval, 'Alessandro', 'Armato','CA6666oeL');
    
insert into users(user_id, first_name, last_name, id_number)
    values(seq_users.nextval, 'Devilman', null,'CA1212oeL');
    
insert into users(user_id, first_name, last_name, id_number)
    values(seq_users.nextval, 'Spiderman', null,'CA9983oeZ');
    
insert into users(user_id, first_name, last_name, id_number)
    values(seq_users.nextval, 'Batman', null,'CA9653oeL');
    
--insertion of services
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 10, 'H2O - 1');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 100, 'H2O - 2');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 300, 'H2O - 3');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 10, 'Elect - 1');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 50, 'Elect - 2');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 100, 'Elect - 3');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 100, 'Fuel - 1');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 200, 'Fuel - 2');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 400, 'Fuel - 3');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 25, 'Repair - 1');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 50, 'Repair - 2');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 100, 'Repair - 3');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 10, 'Menu - 1');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 15, 'Menu - 2');
    
insert into services(service_id, service_cost, service_type)
    values(seq_services.nextval, 20, 'Menu - 3');

--insert boats
insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Deck Boat', 10, 5, 101);
    
insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Fishing Boat', 10, 3, 102);

insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Fishing Boat', 20, 10, 102);

insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Yacht', 30, 15, 103);

insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Kanoe', 3, 1, 104);

insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Floating House', 50, 50, 105);

insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Devilboat', 15, 3, 106);

insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Devilbike', 4, 1, 106);
   
insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Kanoe', 3, 1, 107);    
    
insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Batsubmarine', 50, 5, 108);        
    
insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
    values(seq_boats.nextval, 'Racing Boat', 19, 1, 105);            
--insert moorings
--small moorings (5)
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 5, 5, 108);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 5, 5, 109);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 5, 5, 105);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 5, 5, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 5, 5, null);
    
--medium moorings (10)
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, 103);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, 111);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, 107);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, 101);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, 102);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 30, 20, null);
    
--large moorings (5)
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 40, 30, 104);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 40, 30, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 40, 30, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 40, 30, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 40, 30, null);
    
--special moorings (5)
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 50, 50, 106);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 50, 50, 110);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 50, 50, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 50, 50, null);
    
insert into moorings(mooring_id, mooring_cost, mooring_length, mooring_width, boat_id)
    values(seq_moorings.nextval, 20, 50, 50, null);
commit;    



---------- select tests ----------  
--free moorings
select count(rowid) as "Free Moorings" from moorings where boat_id is null; -- returns the free moorings

--test negative width
--insert into boats(boat_id, boat_type, boat_length, boat_width, user_id)
 --   values(seq_boats.nextval, 'Racing Boat', 19, -1, 105);     
    
    

--test trigger new user

--insert into users(user_id, first_name, last_name, id_number)

  --  values(seq_users.nextval, 'Pippo', 'Baudo', 'CA7992oeL');