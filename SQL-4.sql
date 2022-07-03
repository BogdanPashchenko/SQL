--Создание таблицы samsung
create table phones_samsung(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
)
--Заполнение таблицы 
insert into phones_samsung(model, ram, front_camera, price)
values ('A50', 6, 10, 300),
    ('A50', 8, 10, 400),
    ('A52', 8, 16, 500),
    ('S20', 8, 24, 1500),
    ('S21', 8, 12, 1000),
    ('S22', 6, 12, 1200),
    ('A71', 6, 12, 1200),
    ('A91', 4, 12, 1900),
    ('A57', 8, 8, 900),
    ('A32', 8, 4, 800),
    ('A33', 8, 5, 750),
    ('A43', 8, 5, 850)
 ;
--Создание таблицы Apple
create table phones_apple(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
)

--Заполнение таблицы Apple
insert into phones_apple(model, ram, front_camera, price)
values ('X', 4, 8, 400),
    ('11', 6, 10, 700),
    ('12', 8, 12, 1000),
    ('7', 4, 12, 400),
    ('XR', 6, 12, 800),
    ('XS', 6, 12, 1000),
    ('13', 6, 12, 1500),
    ('8', 4, 12, 700),
    ('SE 2020', 6, 8, 700);

--Поиск телефонов по средней цене
 select * from phones_apple
 where price < (select avg(price) from phones_samsung);

--Вернуть apple которые стоят столько, сколько самсунг
select * from phones_apple
where price in (select price from phones_samsung);

--Поиск телефонов через join по одинаковой цене
select pa.model, pa.price, ps.model, ps.price from phones_apple as pa
join phones_samsung as ps
on pa.price = ps.price;

--Вернуть apple которые не стоят столько, сколько самсунг
select * from phones_apple
where price not in (select price from phones_samsung);

--Вернуть модель меньше всех цен на apple-гаджеты (у которых price <1000) (меньше минимального)
select * from phones_samsung
where price < all(select price from phones_apple where price < 1000);

--Вернуть модель больше всех ценой на apple-гаджеты (у которых price <1000) (больше максимального)
select * from phones_samsung
where price > all(select price from phones_apple where price < 1000);

--Вернуть модели, которые не равны меньшему и большему в подзапросе
select * from phones_samsung
where price <> all(select price from phones_apple where price < 1000);

--Вернуть модели, которые не равны большему числу в подзапросе
select * from phones_samsung
where price < any(select price from phones_apple where price < 1000);

--Вернуть модели, которые не равны большему минимальному числу в подзапросе 
select * from phones_samsung
where price > any(select price from phones_apple where price < 1000);

--union 
-- Выводит уникальные значения
select ram, price from phones_apple
union
select ram, price from phones_samsung;

--union all 
-- Выводит все значения
select ram, price from phones_apple
union all
select ram, price from phones_samsung;

-- средняя цена по оперативной памяти
select ram, avg(price) from phones_apple pa 
group by ram 

--max цена по оперативной памяти
select ram, max(price) from phones_apple pa 
group by ram 

--min цена по оперативной памяти
select ram, min(price) from phones_apple pa 
group by ram 