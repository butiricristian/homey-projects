# README

### Demo project using Rails Hotwire

The app allows user registration using Devise and Project creation using Rails scaffolding

The interesting part is on the project details page, where users can insert comments and change the status of a project and the updates are displayed back to the users using turbo streams: if a user adds a comment, all the users will see the update in real time.

To run the project locally:
1. run `rails db:prepare` to initialize the db
2. make sure you have redis installed and a redis server running `redis-server`
3. run `bin/dev` to start the server and track all code changes
