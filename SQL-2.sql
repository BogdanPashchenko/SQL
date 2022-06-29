--Создать таблицу employees
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);
select * from employees;

--Наполнить таблицу employee 70 строками.
insert into employees (employee_name) 
values ('Vadim'),
('Bogdan'),
('Ivan'),
('Alex'),
('Nikolay'),
('Rais'),
('Boris'),
('Max'),
('Alex'),
('Vadim'),
('Alexey'),
('Bogdan'),
('Ivan'),
('Arkadiy'),
('Nikolay'),
('Rais'),
('Boris'),
('Max'),
('Alex'),
('Yiru'),
('Alexey'),
('Bogdan'),
('Ivan'),
('Sofia'),
('Nikolay'),
('Rais'),
('Maria'),
('Max'),
('Alex'),
('Vadim'),
('Alexey'),
('Bogdan'),
('Ivan'),
('Alex'),
('Tanya'),
('Ksenya'),
('Boris'),
('Max'),
('Alex'),
('Vadim'),
('Alexey'),
('Bogdan'),
('Ivan'),
('Alex'),
('Nikolay'),
('Rais'),
('Boris'),
('Max'),
('Alex'),
('Masha'),
('Alexey'),
('Inna'),
('Ivan'),
('Alex'),
('Nikolay'),
('Rais'),
('Boris'),
('Max'),
('Alex'),
('Vadim'),
('Alexey'),
('Bogdan'),
('Moris'),
('Alex'),
('Nikolay'),
('Nikita'),
('Melis'),
('Max'),
('Alex'),
('Roza'),
('Alexey');

--Создать таблицу salary
create table salary (
id serial primary key,
monthly_salary int not null);
select * from salary;

--Наполнить таблицу salary строками:
insert into salary (monthly_salary)
values (1000), 
(1100), 
(1200), 
(1300), 
(1400), 
(1500), 
(1600), 
(1700), 
(1800), 
(1900), 
(2000), 
(2100), 
(2200), 
(2300), 
(2400),
(2500);

--Создать таблицу employee_salary
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null,
foreign key (employee_id)
references employees(id),
foreign key (salary_id)
references salary(id)
);
select * from employee_salary;

--Наполнить таблицу employee_salary 40 строками:
insert into employee_salary(employee_id,salary_id)
values (3,7),
	   (1,4),
	   (5,9),
	   (40,13),
	   (23,4),
	   (11,2),
	   (52,10),	   
	   (10,13),
	   (26,4),
	   (13,11),
	   (33,7),
	   (19,2),
	   (25,7),
	   (70,13),
	   (53,2),
	   (41,7),
	   (55,12),	   
	   (15,1),
	   (28,8),
	   (64,1),
	   (67,8),
	   (16,10),
	   (51,3),
	   (49,13),
	   (43,5),
	   (12,12),
	   (22,10),	   
	   (35,13),
	   (66,4),
	   (21,1),
	   (47,10),
	   (39,10),
	   (27,13),
	   (31,1),
	   (29,5),
	   (20,12),
	   (18,10),	   
	   (56,13),
	   (58,4),
	   (59,1),
	   (60,7);

--Создать таблицу roles
create table roles (
id serial primary key,
role_name int not null unique);
select * from roles;

--Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name type varchar(30);

--Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

--Создать таблицу roles_employee
create table roles_employee (
id serial primary key,
employee_id int not null unique,
role_id int not null, 
foreign key (employee_id)
references employees(id),
foreign key (role_id)
references roles(id)
);
select * from roles_employee;

--Наполнить таблицу roles_employee
insert into roles_employee (employee_id, role_id )
values (7,2),
(20,4),
(3,9),
(5,13),
(23,4),
(11,2),
(10,9),
(22,13),
(21,3),
(34,4),
(6,7),
(1,5),
(2,6),
(4,9),
(42,11),
(8,19),
(9,18),
(12,14),
(13,12),
(14,5),
(15,7),
(52,20),
(53,9),
(24,14),
(26,17),
(25,1),
(27,5),
(28,8),
(31,4),
(32,6),
(35,9),
(41,8),
(45,17),
(47,13),
(43,12),
(51,1),
(62,11),
(70,3),
(64,2),
(65,8),
(66,1);
select * from roles_employee;