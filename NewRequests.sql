select country, count (*) as country_count
from movies
group by country;

select idgenre, count (*) as movie_count
from moviegenre
group by idgenre
having count(*) > 1;

select name
from staff
where age > (select avg(age) from staff);

select title, 
		tagline, 
		(select name from categories where categories.idcategory = movies.idcategory) as category
from movies;

select movies.title, movies.tagline, categories.name as category
from movies
join categories on categories.idcategory = movies.idcategory;

select movies.title, movies.tagline, categories.name as category
from movies left join categories 
on categories.idcategory = movies.idcategory;

select movies.title, movies.tagline, categories.name as category
from movies full join categories 
on categories.idcategory = movies.idcategory;

select * from movies cross join categories;

select name || ' ' || lastname as fullname
from users
union select name 
from staff;

select *
from movies
where exists ((select * from categories where categories.idcategory = movies.idcategory));
