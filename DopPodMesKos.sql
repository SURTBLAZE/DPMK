drop table if exists Passenger cascade;
create table Passenger
(
        id           int primary key,
        firstname    varchar(30) not null,
        surname      varchar(30) not null,
        birthdate    date,
        phone_number varchar(20) unique
);

drop table if exists Ticket cascade;
create table Ticket
(
        id             int primary key,
        passenger_id   int ,
        validity_from  date,
        validity_until date,
        price          int,
        foreign key (passenger_id) references Passenger(id)
);

drop table if exists PermissionPass cascade;
create table PermissionPass
(
        id              int primary key,
        firstname       varchar(30) not null,
        surname         varchar(30) not null,
        pass_type       varchar(40) not null,
        chip_number     varchar(20) not null
);

drop table if exists Passenger_PermissionPass cascade;
create table Passenger_PermissionPass
(
        passenger_id            int,
        permissionPass_id        int,
        foreign key (passenger_id) references Passenger(id),
        foreign key (permissionPass_id)  references PermissionPass(id),
        primary key (passenger_id,permissionPass_id)
);

drop table if exists Employee cascade ;
create table Employee
(
        id             int primary key,
        firstname      varchar(30) not null ,
        surname        varchar(30) not null ,
        passport       varchar(40) not null ,
        birthdate      date,
        phone_number   varchar(20) unique
);

drop table if exists Vehicle cascade;
create table Vehicle(
        id             int primary key ,
        vehicle_number varchar(10) not null,
        vehicle_type   varchar(30) not null,
        model          varchar(30) not null
);

drop table if exists washingCenter cascade;
create table washingCenter(
        id                 int primary key,
        premises_address   varchar(40) not null 
);

drop table if exists Employee_Vehicle cascade;
create table Employee_Vehicle(
        employee_id  int,
        vehicle_id   int,
        foreign key (employee_id) references Employee(id),
        foreign key (vehicle_id)  references Vehicle(id),
        primary key (employee_id,vehicle_id)
);

drop table if exists Employee_washingCenter cascade;
create table Employee_washingCenter(
        employee_id        int,
        washingCenter_id   int,
        foreign key (employee_id) references Employee(id),
        foreign key (washingCenter_id) references washingCenter(id),
        primary key (employee_id, washingCenter_id)
);

drop table if exists Transport_Line cascade ;
create table Transport_Line(
        id              int primary key ,
        line_number     int,
        transport_type  varchar(30) not null,
        initial_station varchar(30) not null,
        ending_station  varchar(30) not null
);

drop table if exists Vehicle_Transport_Line cascade;
create table Vehicle_Transport_Line(
        vehicle_id         int,
        transport_line_id  int,
        foreign key (vehicle_id)  references Vehicle(id),
        foreign key (transport_line_id) references Transport_Line(id),
        primary key (vehicle_id, transport_line_id)
);

drop table if exists Advertiser cascade;
create table Advertiser(
        id              int primary key,
        company_name    varchar(40) not null,
        phone_number    varchar(20) unique
);

drop table if exists Advertisement cascade;
create table Advertisement(
        id                      int primary key,
        advertiser_id           int,
        title                   varchar(40) not null,
        price                   int,
        validity_from           date,
        validity_until          date,
        advertisement_type      varchar(50) not null,
        count                   int,
        foreign key (advertiser_id) references Advertiser(id)
);

---------------------------------inserting------------------------------------------------------

INSERT INTO employee (id, firstname, surname, passport, birthdate, phone_number)
VALUES (1,'Jozef','Ciger','rd670490fl11','01-08-1978','+421980498177');
INSERT INTO employee (id, firstname, surname, passport, birthdate, phone_number)
VALUES (2,'Edmund','Bicek','rt673000jh45','03-04-1971','+421976735618');
INSERT INTO employee (id, firstname, surname, passport, birthdate, phone_number)
VALUES (3,'Dávid','Debnar','rg673674gl10','02-06-1975','+421260435141');
INSERT INTO employee (id, firstname, surname, passport, birthdate, phone_number)
VALUES (4,'Matúš','Galik','ra673990kh18','11-07-2000','+421950785123');
INSERT INTO employee (id, firstname, surname, passport, birthdate, phone_number)
VALUES (5,'Oleg','Dorko','dt67349dfr67','12-09-1998','+421943135331');
INSERT INTO employee (id, firstname, surname, passport, birthdate, phone_number)
VALUES (6,'Samuel','Borik','cv678970kl10','06-10-1972','+421930435125');
INSERT INTO employee (id, firstname, surname, passport, birthdate, phone_number)
VALUES (7,'Juraj','Finka','xp655490kl10','03-11-1981','+421920439512');
INSERT INTO employee (id, firstname, surname, passport, birthdate, phone_number)
VALUES (8,'Blahoslav','Antal','lo672390kl10','04-05-1987','+421910435784');
INSERT INTO employee (id, firstname, surname, passport, birthdate, phone_number)
VALUES (9,'Stepan','Bandera','qj103490kl10','01-01-1969','+421911445121');

INSERT INTO advertiser (id, company_name, phone_number)
VALUES (1,'MOLD-TRADE','+421976671280');
INSERT INTO advertiser (id, company_name, phone_number)
VALUES (2,'STRABAG s.r.o','+421974984551');
INSERT INTO advertiser (id, company_name, phone_number)
VALUES (3,'ABONEX, s.r.o.','+421260435141');
INSERT INTO advertiser (id, company_name, phone_number)
VALUES (4,'BUILDINGCOM','+421959665123');
INSERT INTO advertiser (id, company_name, phone_number)
VALUES (5,'Pepsi','+421943131331');
INSERT INTO advertiser (id, company_name, phone_number)
VALUES (6,'IT Specialist','+380683920465');

INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (1,5, 'Pepsi zľavy', 697, '03-30-2024','03-30-2025','Celoplošny polep (dlhý autobus)', 5);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (2,5, 'Nová príchuť limetky', 396, '04-08-2024','10-08-2024','E-BOARD XXL',8);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (3,6, 'CyberSecurity Courses', 15, '04-10-2024','05-10-2024','FORMAT A2',40);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (4,6, 'Webinár 25.04', 5, '04-04-2024','04-25-2024','FORMAT A3',100);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (5,4, 'Výstavba balkónov', 162, '05-01-2024','05-01-2025','Zadna Plocha Cela',9);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (6,4, 'Izolácia stien', 171, '02-02-2024','05-02-2024','DOORBOARD',12);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (7,3, 'Slúchadlá ABONEX', 171, '07-01-2024','10-01-2024','DOORBOARD',7);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (8,3, 'IBON 15 Pro Max', 767, '04-15-2024','04-15-2025','Celoplošny polep (dlha električka)',4);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (9,2, 'Vyskúšajte novú kávu', 5, '05-01-2024','05-22-2024','FORMAT A3',20);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (10,2, 'ICE LATTE XXL', 9, '04-14-2024','04-28-2024','FORMAT A2',26);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (11,1, 'Otvorenie nového OC', 820, '04-02-2024','05-02-2024','Celoplošny polep (dlhý autobus)',10);
INSERT INTO advertisement (id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
VALUES (12,1, 'Mega zľavy MOLD-TRADE', 440, '04-01-2024','05-01-2024','BUSBOARD XXL',17);

INSERT INTO passenger (id, firstname, surname, birthdate, phone_number)
VALUES (1, 'Yaroslav', 'Yakushevych','12-27-2004','+421950271552');
INSERT INTO passenger (id, firstname, surname, birthdate, phone_number)
VALUES (2, 'Valeria', 'Yakushevych','10-25-2004','+421097991255');
INSERT INTO passenger (id, firstname, surname, birthdate, phone_number)
VALUES (3, 'Jozef', 'Hudacin','06-26-1967','+421910221443');
INSERT INTO passenger (id, firstname, surname, birthdate, phone_number)
VALUES (4, 'Mia', 'Dudova','08-11-2001','+421959871182');
INSERT INTO passenger (id, firstname, surname, birthdate, phone_number)
VALUES (5, 'Perla', 'Galikova','01-19-1995','+421908271277');
INSERT INTO passenger (id, firstname, surname, birthdate, phone_number)
VALUES (6, 'Varvara', 'Yakushevych','05-22-2007','+421955471500');
INSERT INTO passenger (id, firstname, surname, birthdate, phone_number)
VALUES (7, 'Simon', 'Petlura','07-08-1982','+421020273133');

INSERT INTO permissionpass (id, firstname, surname, pass_type, chip_number)
VALUES (1,'Yaroslav','Yakushevych','ISIC CARD','S908456781');
INSERT INTO permissionpass (id, firstname, surname, pass_type, chip_number)
VALUES (2,'Valeria','Yakushevych','ISIC CARD','S908456782');
INSERT INTO permissionpass (id, firstname, surname, pass_type, chip_number)
VALUES (3,'Varvara','Yakushevych','Školský preukaz','SK903455567');
INSERT INTO permissionpass (id, firstname, surname, pass_type, chip_number)
VALUES (4,'Jozef','Hudacin','Preukaz dôchodcu','D900056137');
INSERT INTO permissionpass (id, firstname, surname, pass_type, chip_number)
VALUES (5,'Mia','Dudova','ISIC CARD','S907656900');

INSERT INTO ticket (id, passenger_id, validity_from, validity_until, price)
VALUES (1,1,'04-01-2024 00:00:00','07-01-2024 00:00:00',34);
INSERT INTO ticket (id, passenger_id, validity_from, validity_until, price)
VALUES (2,2,'04-01-2024 10:25:00','07-01-2024 10:25:00',68);
INSERT INTO ticket (id, passenger_id, validity_from, validity_until, price)
VALUES (3,3,'03-30-2024 16:43:44','04-30-2024 16:43:44',25);
INSERT INTO ticket (id, passenger_id, validity_from, validity_until, price)
VALUES (4,4,'04-10-2024 12:00:23','04-11-2024 12:00:23',4);
INSERT INTO ticket (id, passenger_id, validity_from, validity_until, price)
VALUES (5,5,'04-14-2024 09:44:00','04-15-2024 09:44:00',4);
INSERT INTO ticket (id, passenger_id, validity_from, validity_until, price)
VALUES (6,6,'04-11-2024 16:14:55','04-11-2025 16:14:55',100);
INSERT INTO ticket (id, passenger_id, validity_from, validity_until, price)
VALUES (7,7,'04-18-2024 10:30:00','04-25-2024 10:30:00',6);

INSERT INTO transport_line (id, line_number,transport_type, initial_station, ending_station)
VALUES (1, 17,'Bus','LINGOV','LUNIK IIX');
INSERT INTO transport_line (id, line_number,transport_type, initial_station, ending_station)
VALUES (2, 36,'Bus','Sídlisko KVP','Moskovská');
INSERT INTO transport_line (id, line_number,transport_type, initial_station, ending_station)
VALUES (3, 29,'Bus','Staré mesto','Staničné námestie');
INSERT INTO transport_line (id, line_number,transport_type, initial_station, ending_station)
VALUES (4, 12,'Bus','Šebastovce','Podhradová');
INSERT INTO transport_line (id, line_number,transport_type, initial_station, ending_station)
VALUES (5, 23, 'Bus','Barca','Letisko');
INSERT INTO transport_line (id, line_number,transport_type, initial_station, ending_station)
VALUES (6, 6, 'Tram','Staré mesto','Staničné námestie');

INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (1,'456712','Bus','SOR NB 12');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (2,'123879','Tram','Vario LF');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (3,'789432','Tram','Vario LF2 plus');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (4,'908734','Bus','Solaris Urbino 12');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (5,'119845','Bus','Solaris Urbino 15');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (6,'783467','Bus','Karosa B 952 .1714');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (7,'128957','Tram','Vario LF2 plus');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (8,'129854','Tram','KT8D5.RN2');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (9,'178346','Bus','SOR NB 12');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (10,'456554','Bus','SOR NB 12');
INSERT INTO vehicle (id, vehicle_number, vehicle_type, model)
VALUES (11,'167311','Bus','SOR NB 12');

INSERT INTO washingcenter (id, premises_address)
VALUES (1,'Mikoviniho 22/a');
INSERT INTO washingcenter (id, premises_address)
VALUES (2,'Bratislavska 1');
INSERT INTO washingcenter (id, premises_address)
VALUES (3,'Hrdinov 11/b');
INSERT INTO washingcenter (id, premises_address)
VALUES (4,'Hlavna 77/a');
INSERT INTO washingcenter (id, premises_address)
VALUES (5,'Michalovska 35');

INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (1,7);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (2,4);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (2,6);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (4,5);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (5,9);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (9,1);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (7,7);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (8,8);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (9,9);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (2,10);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (6,11);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (6,7);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (1,5);
INSERT INTO employee_vehicle (employee_id, vehicle_id)
VALUES (3,8);


INSERT INTO employee_washingcenter (employee_id, washingcenter_id)
VALUES (4,1);
INSERT INTO employee_washingcenter (employee_id, washingcenter_id)
VALUES (2,1);
INSERT INTO employee_washingcenter (employee_id, washingcenter_id)
VALUES (3,2);
INSERT INTO employee_washingcenter (employee_id, washingcenter_id)
VALUES (7,3);
INSERT INTO employee_washingcenter (employee_id, washingcenter_id)
VALUES (9,4);
INSERT INTO employee_washingcenter (employee_id, washingcenter_id)
VALUES (6,5);
INSERT INTO employee_washingcenter (employee_id, washingcenter_id)
VALUES (1,5);

INSERT INTO passenger_permissionpass (passenger_id, permissionpass_id)
VALUES (1,1);
INSERT INTO passenger_permissionpass (passenger_id, permissionpass_id)
VALUES (2,2);
INSERT INTO passenger_permissionpass (passenger_id, permissionpass_id)
VALUES (3,3);
INSERT INTO passenger_permissionpass (passenger_id, permissionpass_id)
VALUES (4,4);
INSERT INTO passenger_permissionpass (passenger_id, permissionpass_id)
VALUES (5,5);


INSERT INTO vehicle_transport_line (vehicle_id, transport_line_id)
VALUES (2,1);
INSERT INTO vehicle_transport_line (vehicle_id, transport_line_id)
VALUES (4,2);
INSERT INTO vehicle_transport_line (vehicle_id, transport_line_id)
VALUES (5,1);
INSERT INTO vehicle_transport_line (vehicle_id, transport_line_id)
VALUES (6,5);
INSERT INTO vehicle_transport_line (vehicle_id, transport_line_id)
VALUES (7,4);
INSERT INTO vehicle_transport_line (vehicle_id, transport_line_id)
VALUES (8,3);
INSERT INTO vehicle_transport_line (vehicle_id, transport_line_id)
VALUES (9,6);
INSERT INTO vehicle_transport_line (vehicle_id, transport_line_id)
VALUES (10,4);
INSERT INTO vehicle_transport_line (vehicle_id, transport_line_id)
VALUES (11,3);

---------------------------------------Creating Views------------------------------------

DROP VIEW IF EXISTS find_all_current_tickets
CREATE VIEW find_all_current_tickets as
SELECT *
FROM ticket t
WHERE now() > t.validity_from and now() < t.validity_until ORDER BY t.price;


DROP VIEW IF EXISTS find_all_spring_advertisment_above_400€
CREATE VIEW find_all_spring_advertisment_above_400€ as
SELECT a.title, round(a.price*a.count) || '€' as TotalPrice
FROM advertisement a
WHERE extract(month from a.validity_from) >= 3 and extract(month from a.validity_until) <= 5
AND round(a.price*a.count) >= 400;


DROP VIEW IF EXISTS show_advertisers_and_total_price
CREATE VIEW show_advertisers_and_total_price as
SELECT adv1.company_name,
       sum(adv2.price*adv2.count) || '€' as TotalPrice
FROM advertiser adv1
    join advertisement adv2 on adv1.id = adv2.advertiser_id
    group by adv1.company_name
    order by sum(adv2.price*adv2.count) desc;


DROP VIEW IF EXISTS show_all_permissions_and_their_count
CREATE VIEW show_all_permissions_and_their_count as
SELECT p.pass_type,
       count(*) as count
FROM permissionpass p
group by p.pass_type
order by count(*) desc;


DROP VIEW IF EXISTS show_the_numbers_of_all_transport_that_is_on_route_17
CREATE VIEW show_the_numbers_of_all_transport_that_is_on_route_17 as
SELECT v.vehicle_number as number,
       v.model,
       t.line_number
FROM vehicle v
    join vehicle_transport_line vt on v.id = vt.vehicle_id
    join transport_line t on vt.transport_line_id = t.id
    where t.line_number = 17
    group by t.line_number, v.vehicle_number, v.model
    order by v.model;


DROP VIEW IF EXISTS show_passengers_who_have_tickets_above_50€
CREATE VIEW show_passengers_who_have_tickets_above_50€ as
SELECT p.firstname || ' ' || p.surname as name,
       t.price || '€' as price
FROM passenger p
    join ticket t on p.id = t.passenger_id
    where t.price > 50
    order by t.price;


DROP VIEW IF EXISTS show_passengers_without_permission
CREATE VIEW show_passengers_without_permission as
SELECT p.firstname || ' ' || p.surname as passanger
FROM passenger p
    left outer join passenger_permissionpass pp on p.id = pp.passenger_id
    where pp.permissionpass_id is null
    order by p.birthdate;



-- Functions
-------------------------------------------------------------------------------------------
drop function if exists getAdvertisementByPrice(start_price int,end_price int);

create or replace function getAdvertisementByPrice(start_price int, end_price int)
returns table(
                title varchar,
                price int
             )
    as $$
        begin
            return query select a.title, a.price from advertisement a
                where a.price > start_price AND a.price < end_price order by a.price;
        end;
    $$
language plpgsql;

select getAdvertisementByPrice(200,1000);
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
drop function if exists getLineByVehicleNumber(number varchar, out lineNumber int);

create or replace function getLineByVehicleNumber(number varchar,out lineNumber int)
returns int
    as $$
        begin
            select t.line_number
                from vehicle v
                    join vehicle_transport_line vt on v.id = vt.vehicle_id
                    join transport_line t on vt.transport_line_id = t.id
                    where v.vehicle_number = number
                    into lineNumber;
        end;
    $$
language plpgsql;

select getLineByVehicleNumber('128957');
---------------------------------------------------------------------------------------------

--Procedures
---------------------------------------------------------------------------------------------
drop procedure if exists ChangeLineForVehicle(number varchar);
create or replace procedure ChangeLineForVehicle(number varchar,newLine int)
language plpgsql
as $$
declare
    vehicleId int;
    transportLineId int;
begin
     select v.id from vehicle v where v.vehicle_number = number into vehicleId;
     select t.id from transport_line t where t.line_number = newLine into transportLineId;

     update vehicle_transport_line
     set transport_line_id = transportLineId
     where vehicle_id = vehicleId;
end $$;

call ChangeLineForVehicle('908734',36);
---------------------------------------------------------------------------------------------


--Triggers
---------------------------------------------------------------------------------------------
create or replace function advertisement_trigger_function()
    returns trigger
    language plpgsql
as $$
begin
    if new.title ilike '%alcohol%' then
        raise exception 'Nemožno pridať reklamu s alkoholom';
    end if;

    return new;
end;
$$;

drop trigger if exists advertisement_trigger on advertisement;
create trigger advertisement_trigger
before insert
on advertisement
for each row
execute procedure advertisement_trigger_function();

insert into advertisement(id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
values (13,1,'New REVO alcohol drink',100,'2024-04-18','2024-05-18','FORMAT A2',10);
insert into advertisement(id, advertiser_id, title, price, validity_from, validity_until, advertisement_type, count)
values (13,1,'New REVO ovocny drink',100,'2024-04-18','2024-05-18','FORMAT A2',10);
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
create or replace function view_trigger_function()
    returns trigger
    language plpgsql
as $$
begin
    if new.validity_from > new.validity_until then
        raise exception 'Error. validaty_from > validaty_until';
    end if;

    return new;
end;
$$;

drop trigger if exists view_trigger on find_all_current_tickets;
create trigger view_trigger
instead of update
on find_all_current_tickets
for each row
execute procedure view_trigger_function();

update find_all_current_tickets
    set validity_from = '2028-04-11'
    where id = 6;

---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
create or replace function employee_vehicle_trigger_function()
    returns trigger
    language plpgsql
as $$
declare
    pocet_aut int;
begin
    select count(*) from employee_vehicle e where employee_id = new.employee_id into pocet_aut;
    if pocet_aut = 3 then
        raise exception 'Jeden vodič môže pracovať maximálne na troch autobusoch';
    end if;

    return new;
end;
$$;

drop trigger if exists employee_vehicle_trigger on employee_vehicle;
create trigger employee_vehicle_trigger
before insert
on employee_vehicle
for each row
execute procedure employee_vehicle_trigger_function();

insert into employee_vehicle(employee_id, vehicle_id) values (1,10);
---------------------------------------------------------------------------------------------

------------Sequence
---------------------------------------------------------------------------------------------
create sequence primary_key_employee_sequence
start with 10
increment by 1
maxvalue 50000;

create or replace function autoincrement_primary_key_employee()
returns trigger
as $$
begin
    if new.id is null then
        new.id := nextval('primary_key_employee_sequence');
    end if;

    return new;
end; $$
language plpgsql;

create trigger autoincrement_primary_key_employee_trigger
before insert on employee
for each row
execute function autoincrement_primary_key_employee();

insert into employee(id, firstname, surname, passport, birthdate, phone_number)
values (null,'Vasyl','Skrypnik','dasdasdasd123','1902-09-10','4134124124');
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
create sequence primary_key_passenger_sequence
start with 8
increment by 1
maxvalue 50000;

drop table if exists Winners cascade;
create table Winners
(
        firstname    varchar(30) not null,
        surname      varchar(30) not null,
        phone_number varchar(20) unique
);

create or replace function autoincrement_primary_key_passenger()
returns trigger
as $$
begin
    if new.id is null then
        new.id := nextval('primary_key_passenger_sequence');
        if mod(new.id,1000) = 0 then
            insert into winners(firstname,surname,phone_number) values (new.firstname,new.surname,new.phone_number);
        end if;
    end if;

    return new;
end; $$
language plpgsql;

create trigger autoincrement_primary_key_passenger_trigger
before insert on passenger
for each row
execute function autoincrement_primary_key_passenger();
---------------------------------------------------------------------------------------------
