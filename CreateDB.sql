create table if not exists Roles
(
	idRole serial primary key,
	name varchar(30),
	unique (idRole, name)	
);

create table if not exists Users
(
	idUser serial primary key,
	idRole integer,
	name varchar(30),
	lastName varchar(30),
	password varchar(30),
	email varchar(30),
	isBlocked bool default false,
	foreign key (idRole) references Roles (idRole) on delete restrict,
	unique (idUser, email)
);

create table if not exists Logs
(
	idUser integer,
	date timestamp,
	info varchar(100),
	foreign key (idUser) references Users (idUser) on delete restrict,
	primary key(iduser, date, info)
);

create table if not exists Categories
(
	idCategory serial primary key unique,
	name varchar(20)
);

create table if not exists Genres
(
	idGenre serial primary key unique,
	name varchar(30)
);

create table if not exists Staff
(
	idStaff serial primary key unique,
	name varchar(30),
	age integer check(age > 0 and age < 100),
	description varchar(500),
	image varchar(200)
);

create table if not exists Movies
(
	idMovie serial primary key unique,
	idCategory integer,
	title varchar(50),
	tagline varchar(50),
	description varchar(800),
	poster varchar(200),
	year integer,
	country varchar(50),
	worldPremiere timestamp,
	budget integer,
	feesInUsa integer,
	feesInWorld integer,
	check((year > 1894) and (budget > 0) and (feesInUsa > 0) and (feesInWorld > 0)),
	foreign key (idCategory) references Categories (idCategory) on delete restrict
);

create table if not exists MovieGenre
(
	idGenre integer,
	idMovie integer,
	foreign key (idGenre) references Genres (idGenre) on delete restrict,
	foreign key (idMovie) references Movies (idMovie) on delete restrict,
	primary key(idGenre, idMovie)
);

create table if not exists Actors
(
	idStaff integer,
	idMovie integer,
	foreign key (idStaff) references Staff (idStaff) on delete restrict,
	foreign key (idMovie) references Movies (idMovie) on delete restrict,
	primary key(idStaff, idMovie)
);

create table if not exists Directors
(
	idStaff integer,
	idMovie integer,
	foreign key (idStaff) references Staff (idStaff) on delete restrict,
	foreign key (idMovie) references Movies (idMovie) on delete restrict,
	primary key(idStaff, idMovie)
);

create table if not exists Reviews
(
	idReview serial primary key unique,
	idMovie integer,
	visitor integer,
	text varchar(500),
	foreign key (idMovie) references Movies (idMovie) on delete restrict
);

create table if not exists Ratings
(
	idRating serial primary key unique,
	idMovie integer,
	visitor integer,
	grade integer check(grade >= 1 and grade <= 10),
	foreign key (idMovie) references Movies (idMovie) on delete restrict
);