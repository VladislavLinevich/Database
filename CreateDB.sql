create table if not exists Roles
(
	idRole serial primary key,
	name varchar(32),
	unique (idRole, name)	
);

create table if not exists Users
(
	idUser serial primary key,
	idRole integer,
	name varchar(32),
	lastName varchar(32),
	password varchar(32),
	email varchar(32),
	isBlocked bool default false,
	foreign key (idRole) references Roles (idRole) on delete restrict,
	unique (idUser, email)
);

create table if not exists Logs
(
	idUser integer,
	date timestamp,
	info varchar(128),
	foreign key (idUser) references Users (idUser) on delete restrict,
	primary key(iduser, date, info)
);

create table if not exists Categories
(
	idCategory serial primary key unique,
	name varchar(32)
);

create table if not exists Genres
(
	idGenre serial primary key unique,
	name varchar(32)
);

create table if not exists Staff
(
	idStaff serial primary key unique,
	name varchar(32),
	age integer check(age > 0 and age < 100),
	description varchar(1024),
	image varchar(256)
);

create table if not exists Movies
(
	idMovie serial primary key unique,
	idCategory integer,
	title varchar(64),
	tagline varchar(64),
	description varchar(1024),
	poster varchar(256),
	year integer,
	country varchar(64),
	worldPremiere date,
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
	idUser integer,
	idMovie integer,
	text varchar(512),
	foreign key (idMovie) references Movies (idMovie) on delete restrict,
	foreign key (idUser) references Users (idUser) on delete restrict,
	primary key(idUser, idMovie)
);

create table if not exists Ratings
(
	idUser integer,
	idMovie integer,
	grade integer check(grade >= 1 and grade <= 10),
	foreign key (idMovie) references Movies (idMovie) on delete restrict,
	foreign key (idUser) references Users (idUser) on delete restrict,
	primary key(idUser, idMovie)
);