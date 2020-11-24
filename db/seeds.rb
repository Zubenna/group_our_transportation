# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create(first_name: 'Daniel', last_name: 'Eze', email: 'tester1.email@example.com', username: 'testerone')
@user2 = User.create(first_name: 'David', last_name: 'Umahi', email: 'davido.email@example.com', username: 'testertwo')
@user1 = User.create(first_name: 'Rochas', last_name: 'Okorocha', email: 'roch.email@example.com', username: 'testerthree')