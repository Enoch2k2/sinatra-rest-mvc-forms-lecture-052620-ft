# Change to schedule

Today we are covering MVC, REST, FORMS, and CRUD
Wednesday - User Authentication
Thursday - Project Prep
Friday - Open Office Hours - possible Fwitter Walkthrough

# What is MVC?
- Model
  - Represents Data
  - Ruby Classes
  - Has helper methods scope down via active record query methods

- View
  - All of html
  - What the user sees
  - Erb (Embedded Ruby)
- Controller
  - Routing
  - Relays data from the browser to the app and from the app to the browser

# What is REST?
Create Routes:
  GET /todos/new - give us a new form for creating a todo
  POST /todos - post todo information from the new form

READ Routes:
  GET /todos - getting an index of a resource
  GET /todos/:id - getting more information (show page) of a resource

UPDATE ROUTES:
  GET /todos/:id/edit - serve a edit form to update a resource
  PATCH /todos/:id - used to send information to the controller form a form to update a resource

DESTROY / DELETE ROUTES:
  DELETE /todos/:id - used to delete a resource

# What is CRUD?
- Create
  - Is for creating a new resource that would be stored in the database
- Read
  - Reading information from your database in the browser (list or more information)
- Update
  - Is when we want to update a resource, for example we made a typo and want to correct it. (edit, update)
- Destroy / DELETE
  - Deleting a resource