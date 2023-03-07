# Starwars API with Prisma and Express.
Express Typescript project
 - This is a REST API built with Node.js, Prisma, and Express in Typescript that allows you to retrieve information about the Star Wars universe.
# Technologies used.
 - Node.js
 - Typescript
 - Express
 - Prisma ORM
 - PostgreSQL
 
 # Getting Started
 1) Clone this Repository.
- git clone https://github.com/kanadamprathima/Backstage.git
2) Install dependencies:
- npm install
3) Set up your database connection in the .env file:
- DATABASE_URL="postgresql://user:password@localhost:5432/my_database".
-  you need to replace user and password with your own PostgreSQL username and password.
4) Run the database migration:
- npx prisma migrate dev
5) Seed the database with some initial data:
- npx run seed
6) Start the server.
- npm run dev 
- The server will be running at http://localhost:4000.

