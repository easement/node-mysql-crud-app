## opportunity-finder
Purpose: To find opportunites for folks in large organizations with a bias towards lower experieced/leveled folks helping out higher eveled folks.  Results are sorted by lower seniority level folks first because it's more impactful for them to help you by creating opportunites for new folks who can help, but may be overlooked due to their current position in the org.

The static pages consume a RESTful API.  Built as part of Maker Week so it's not  elegant, but gets the job done. 

Two main pieces of functionality:
* Topics/goals - A page to allow you to see all who knows about a given topic 
* Employee - Given an employee, see who they can help or who can help them for all topics. 

### Authors: Matt Billings + Jenn Islam
Heavily based on Raul Gupta's https://github.com/rahulguptafullstack/node-mysql-crud-app as a starting point


### `MySQL configuration`
Database connection info in the `config/db.config.js` file.
DB structure and demo content located in `db_init.sql`file. 
Note: if you run into GROUP BY issue, then there are a couple of options:
* run `set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';` in MySQL
* add the following to my.cnf file `sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION`

In the project directory, you can run:

### `npm install`

This will install the dependencies inside `node_modules`

### `node server.js` OR `nodemon start` OR `npm start`

Runs the app in the development mode.<br>
Open [http://localhost:5000](http://localhost:5000) to view it in the browser.


### Ideas for the future
* CRUD for employees/subject matter
* Orgazational Groups/Business Units - Could be used for things like embed program. 
* Search/Pagination
* Unit tests
