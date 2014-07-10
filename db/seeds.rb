# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Users = User.create([{ name: 'Jordan', password: 'meerkat'}, {name: 'Tester', password: 'tester'}])
Team = Team.create([{name: 'meerkat development'}])
Sprint = Sprint.create([{name: 'Database Sprint (1)'}])