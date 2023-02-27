# README

### Demo project using Rails Hotwire

Hosted at: https://homey-project.herokuapp.com
For a quick login you can use the following user:

```
email: user@example.com
password: pass1234
```

The app allows user registration using Devise and Project creation using Rails scaffolding

The interesting part is on the project details page, where users can insert comments and change the status of a project and the updates are displayed back to the users using turbo streams: if a user adds a comment, all the users will see the update in real time.

There are a couple of questions that I think are worth asking about the requirements:

1. Should all routes be protected by authentication?
   I assumed the answer should be yes as projects might contain sensitive data
   
2. Should new comments be seen in real-time by all users
   I assumed the answer should be yes as on similar projects such as facebook or twitter this is the approach
   
3. Do user comments and status change comments have similar characteristics?
   They seem to be quite similar, so I chose to implement them using single table inheritance and to display them just a bit differently

To run the project locally:
1. run `rails db:prepare` to initialize the db
2. make sure you have redis installed and a redis server running `redis-server`
3. run `bin/dev` to start the server and track all code changes
