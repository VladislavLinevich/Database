insert into roles(name)
values
('user'),
('moderator'),
('admin');

insert into users(idrole, name, lastname, password, email)
values
(3, 'Vlad', 'Linevich', '123456', 'vlad@gmail.com'),
(2, 'Vadim', 'Linevich', '123456', 'vadim@gmail.com'),
(1, 'Misha', 'Romanov', '123456', 'Misha@gmail.com');

insert into categories(name)
values
('Фильм'),
('Мультфильм');

insert into genres(name)
values
('Боевик'),
('Драма'),
('Фэнтези'),
('Комедия');


insert into genres(name)
values
('Боевик'),
('Драма'),
('Фэнтези'),
('Комедия');

insert into staff(name, age, description, image)
values
('Эдвард Нортон', 52, 'Американский актёр, режиссёр, продюсер, сценарист и активист.', 'path'),
('Квентин Тарантино', 59, 'Американский кинорежиссёр, сценарист, актёр, кинопродюсер, кинооператор.', 'path'),
('Леонардо Ди Каприо', 47, 'Американский актёр, продюсер и общественный деятель.', 'path'),
('Тони Кэй', 69, 'Британский кинорежиссёр, который снимал художественные и документальные фильмы. ', 'path'),
('Брэд Питт', 58, 'Американский актёр и кинопродюсер.', 'path');

insert into movies(idcategory, title, tagline, description, poster, year, country, worldpremiere, budget, feesinusa, feesinworld)
values
(1, 'Американская история Х', 'Преступление и наказание', 'Лидер местной банды скинхедов Дерек Виньярд прочно удерживает авторитет в своём районе.', 'path', 1998, 'США', '1998-07-01', 20000000, 6719864, 23875127),
(1, 'Однажды в… Голливуде', 'The 9th Film from Quentin Tarantino', '1969 год, золотой век Голливуда уже закончился. Известный актёр Рик Далтон и его дублер Клифф Бут пытаются найти свое место в стремительно меняющемся мире киноиндустрии.', 'path', 2019, 'США, Великобритания', '2019-05-21', 90000000, 140838749, 372711080);

insert into moviegenre(idgenre, idmovie)
values
(2, 1),
(2, 2),
(4, 2);

insert into directors(idstaff, idmovie)
values
(4, 1),
(2, 2);

insert into actors(idstaff, idmovie)
values
(1, 1),
(3, 2),
(5, 2);

insert into ratings(iduser, idmovie, grade)
values
(2, 1, 10),
(3, 1, 9),
(2, 2, 8),
(3, 2, 10);

insert into reviews(iduser, idmovie, text)
values
(2, 1, 'Отличный фильм!!'),
(3, 1, 'Изумительно.'),
(2, 2, 'Неплохой фильм'),
(3, 2, 'Шедевр кинематографа!!');