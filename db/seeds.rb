# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Users = User.create([{ name: 'Jordan', password: 'meerkat', image: "optimus.jpg", email: "beauchjord@gmail.com"}, {name: 'Tester', password: 'tester', email: 'tester@testly.com', image: 'blastoise.jpg'}])
Team = Team.create([{ name: 'meerkat development'}])
Sprint = Sprint.create([{ name: 'Database Sprint (1)'}])