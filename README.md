# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# https://medium.com/@oliver.seq/creating-a-rest-api-with-rails-2a07f548e5dc
# generate project with api mode with database connections
  * $ rails new rest-api-guide --api --database=postgresql
# generate project with model
  * $ rails generate model User username:string password:string
  * $ rails generate model Fact user:references fact:string likes:integer
# create Migrations
  * $ rails db:setup
  * $ rails db:migrate
# create controller
  * $ rails g controller api/v1/Users
  * $ rails g controller api/v1/Facts
# rails console to insert data into database
  * $ rails c.
  * $ oliver = User.create( username: 'Oliver', password: 'password' )
  * $fact_one = Fact.create( fact: 'Wiley Hardeman Post was the first pilot to fly solo around the world.', likes: 1, user_id: 1 )
  * $ fact_two = Fact.create( fact: 'The Symphony No1 in E flat major, K.16, was written by Wolfgang Amadeus Mozart at the age of 8.’ likes: 2, user_id: 1 )