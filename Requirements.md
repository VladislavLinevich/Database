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

![alt text](Pictures/diagram.png)
---
Database description:

**Highlighted** fields are primary keys or part of them

- User - all users
   - **IdUser** - uuid
   - IdRole - uuid(foreign key)
   - Name - text(user name)
   - LastName - text(user last name)
   - Password - text(user password)
   - Email - text(user email)
   - Is_blocked - bool(is the user blocked or not)

- Role - roles for users
   - **IdRole** - uuid
   - Name - text(role name)
- Log - user action logs
   - **IdUser** - uuid(foreign key)
   - Date - time(time of user action)
   - Info - text(user action for log)

- Review - movie review
   - **IdReview** - uuid
   - IdMovie - uuid(foreign key)
   - Text - text(movie review text)
   - User - uuid(IdUser, one to one review user)

- Rating - movie rating
   - **IdRating** - uuid
   - IdMovie - uuid(foreign key)
   - Grade - int(movie rating from 1 to 10)
   - User - uuid(IdUser, one to one rating user)

- Category - movie category
   - **IdCategory** - uuid
   - Name - text(category name)

- Movie
   - **IdMovie** - uuid
   - IdCategory - uuid(foreign key)
   - Title - text(movie title)
   - Tagline - text(movie tagline)
   - Description - text(movie description)
   - Poster - text(movie poster image path)
   - Year - int(movie release year)
   - Country - text(movie production country)
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
   - Name - text(genre name)

- Staff - movie staff
   - **IdStaff** - uuid
   - Name - text(staff member name)
   - Age - int(staff member age)
   - Description - text(staff member description)
   - Image - text(staff member image path)
---
Normalized database:

![alt text](Pictures/normalized.png)
