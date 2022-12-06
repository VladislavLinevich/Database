## Requirements:
1. User roles:
   - default
   - moderator
   - admin
---
1. Default user:
   - authentification
   - leave a review for the movie
   - rate the movie
2. Moderator:
   - delete reviews
   - edit and add movies, actors
3. Admin:
   - same as moderator and block user
---
Database diagram:

![alt text](Pictures/DbDiagram.png)
---
Database description:

**Highlighted** fields are primary keys or part of them

- User - all users
   - **IdUser** - uuid
   - IdRole - uuid(foreign key)
   - Name - varchar(32, user name)
   - LastName - varchar(32, user last name)
   - Password - varchar(32, user password)
   - Email - varchar(32, user email)
   - Is_blocked - bool(is the user blocked or not)

- Role - roles for users
   - **IdRole** - uuid
   - Name - varchar(32, role name)
- Log - user action logs
   - **IdUser** - uuid(foreign key)
   - Date - time(time of user action)
   - Info - varchar(128, user action for log)

- Review - movie review
   - **IdUser** - uuid(foreign key)
   - **IdMovie** - uuid(foreign key)
   - Text - varchar(512, movie review text)

- Rating - movie rating
   - **IdUser** - uuid(foreign key)
   - **IdMovie** - uuid(foreign key)
   - Grade - int(movie rating from 1 to 10)

- Category - movie category
   - **IdCategory** - uuid
   - Name - varchar(32, category name)

- Movie
   - **IdMovie** - uuid
   - IdCategory - uuid(foreign key)
   - Title - varchar(64, movie title)
   - Tagline - varchar(64, movie tagline)
   - Description - varchar(1024, movie description)
   - Poster - varchar(256, movie poster image path)
   - Year - int(movie release year)
   - Country - varchar(64, movie production country)
   - World_premiere - time(movie release date)
   - Budget - int(movie production budget)
   - Fees_in_USA - int(fees in USA)
   - Fees_in_world - int(fees in the world)

- Actors - many to many table between movie and staff
   - **IdStaff** - uuid(foreign key)
   - **IdMovie** - uuid(foreign key)

- Directors - many to many table between movie and staff
   - **IdStaff** - uuid(foreign key)
   - **IdMovie** - uuid(foreign key)

- MovieGenre - many to many table between movie and genre
   - **IdGenre** - uuid(foreign key)
   - **IdMovie** - uuid(foreign key)

- Genre - movie genre
   - **IdGenre** - uuid
   - Name - varchar(32, genre name)

- Staff - movie staff
   - **IdStaff** - uuid
   - Name - varchar(32, staff member name)
   - Age - int(staff member age)
   - Description - varchar(1024, staff member description)
   - Image - varchar(256, staff member image path)
---
Normalized database:

![alt text](Pictures/normalized.png)
