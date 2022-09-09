# README

This readme showcases all the information needed to run Instagram-Clone Application

## Github

To Run this code follow these steps:

- Press the green button named "code" placed on the right of of git repository

- After clicking "code" button, dropdown appears

- From dropdown press "download the zip" button

- The code zip folder will be downloaded on your local drive

- Unzip the code in seperate folder

- Open the App in CMD

- Runs 'rails s' command

- Now write 'http://localhost:3000/' in the broswer

## Rails New App

To setup new rails app following packages:

- run 'rails new myapp'

## Gemfile

The below mentioned gems are required in the Gemfile for the application to work properly

- Ruby version 2.7.0

- Rails Version 5.2.8.1

- Active Storage

- Cloudniary gem

- devise gem

- figrao gem

- pg gem

- pundit gem

- bundle install --> in order to install these packages

- After intstalling required packages open database.yml file.

- Replace sqlite settings from postgresql

- You can follow this guideline to set postgresl in your app

- Postgresql link: https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos

## Environment Variables

To protect credentials use ENV variables

- GMAIL_USERNAME
- GMAIL_PASSWORD
- DB_NAME
- DB_USERNAME
- DB_PASSWORD
- DB_NAME_TEST
- DB_NAME_PRODUCTION
- DB_USERNAME_PRODUCTION
- SMTP_USERNAME
- SMTP_PASSWORD
- CLOUDINARY_CLOUD_NAME
- CLOUDINARY_API_KEY
- CLOUDINARY_API_SECRET

You can store these in application.yml provided by figaro

## Heroku Setup

In order to deploy this app on heroku you need to follow these steps

- Open the link https://www.heroku.com in broswer

- Make new account on heroku

- After making new account next we need to install heroku on our local machine

- We need to run 'npm install -g heroku' in order to install it

- After that create new app from heroku dashboard and name it according to your choice.

- Follow the steps given on heroku dashboard after creating new app

- After setting heroku-stack on project directory you need to push code from git to heroku

- Run this command in your application root folder 'git push heroku master'

In order to set database in your heroku server following steps should be followed-

- Put this line in database.yml file under production: database: <%= ENV["DATABASE_URL"] %>

- Now run this command 'heroku run rails db:migrate' in order to migrate all migrations

- 'heroku run rails db:seed' will be used in order to populate the database with test data

## Configuration for Instagram-Clone app

- Mailer configurations are set for forgot password functionality.
- Default mailer sender is 'abdulmalik.saghir@devsinc.com'.
- Credentials are saved in application.yml file.
- Policies are written using Pundit (requirements mentioned).
- Image files are using cloudinary for storage.

## Database creation and initialization

- To setup database (create, load schema, populate with initial test data)
  Command: 'rails db:setup'
- It will create 2 users for initial testing of application.
  Email: abdulmalik.saghir@devsinc.com with password: 123456
  Email: ahmed.waheed@devsinc.com with password: 123456
  You can initially login with these credentials otherwise
  you can signup for your personal account.

## Services

- StoryExpires Job is created to destroy the story after 24 hours of creation(if it still exists).
