# README

## Group Our Transportation App (Rails Capstone Project)

This project entails building an online appllication where a user or group logs all the distances covered in Kilometer(KM) within a particular period for various means of transportations. Each means of transportation is set up as a group that will contain record of movements made within such group. User can also create records for each particular means of transportation used. This include recording in particular, the distance covered by in that movement in KM, the date and time of movement, the creator of the record and the current total of distance in KM displayed at the top right corner of the app page. User must create account and log in before creating records. This project employed the implementation of rails MVC architecture, utilising model, controller, view, routes, associations, partials and styling knowledge in building a rails app.

## Features 
- User can sign up into the app.
- User can log in after sign up. 
- User can create a new transportation log.
- User can create a new transportation group.
- User can edit or delete transportation or group record.
- Logged in user will see all transportation logs he created 
  arranged according to most recent record.
- Logged in user will see all logs he created but were not assigned to a group.
- Logged in User will see all groups arranged alphabetically.

## Project SetUp/Installation

Get a local copy of the file. Clone with HTTPS using the command below.

```
git clone https://github.com/Zubenna/group_our_transportation.git
```
Access project folders 
```
cd group_our_transport
```
Install all the dependencies
```
bundle install
```

Create the database with the following command
```
rails db:create
```
Migrate the database with the following command
```
rails db:migrate
```
Populate the database with the following command
```
rails db:seed
```
Run Application test while on the project root with the following command
## Please run tests separately as indicated below to avoid ambiguity
```
rspec
```

## Run the server
- While in the project root, start rails server with the command 'rails server'.
- In your browser, type http://localhost:3000 to access the app.
- You can now sign up or Log in,to test all features.
- Example; Log in with username,  melody or franco.

## Live Version
- Launch App: ()

## Built With
- Ruby, Ruby on Rails
- RSpec, Capybara
- HTML
- CSS

## Authors

👤 **Nnamdi Emelu**
- Github: [@zubenna](https://github.com/zubenna)
- Twitter: [@zubenna](https://twitter.com/zubenna)
- Linkedin: [nnamdi-emelu](https://www.linkedin.com/in/nnamdi-emelu/)

##  Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Zubenna/group_our_transportation/issues)

## Show your support

Give a star if you like this project!

## Acknowledgments
- I appreciate the effort of **Gregoire Vella**, the UI designer.
- Project originally taken from The Odin Project
- Project inspired by Microverse Program
