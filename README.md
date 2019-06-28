# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.6.3

* System dependencies:

  - Create Account in https://bitly.com/
  - Create Access Token in https://bitly.com/
  - Install PostgreSQL in the PC Or Server

* Configuration:

  - Edit credentials.yml by run this command: `EDITOR="vim" rails credentials:edit`,
  then add:

  ```
  bitly:
    login: XXXX
    access_token: XXXX
  ```

* Database creation:

  `database.yml` in the Repo, I didn't add it in .gitignore.
  you can change username & password & db name
  depend on your DB in the server.

* How to run the test suite

- Run `rake test .`

* Notes:

  - Algorithm of **shortest path** is DFS Algorithm.
  It's working for small business companies, not huge number of users.
  if huge number of users, May we will nedd to build Graph Database using `neo4j`
  I started a trial, but not completed in branch `graph_users`
