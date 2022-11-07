select * from staff
where age < 55;

select title from movies
where country in ('США', 'Китай');

select * from staff
limit 2 offset 1;

select title, feesinworld - feesinusa as feeswithoutusa
from movies
order by feeswithoutusa;

select * from users
where name like 'V%';

insert into users(name, lastname, password, email)
values
('Ben', 'McMillan', '123456', 'vlad@gmail.com');

update users
set lastname = 'Robertson'
where name = 'Ben';

delete from users
where name = 'Ben';

select max(feesinworld) from movies;