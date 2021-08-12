# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ToDo.destroy_all

ToDo.create title: "First To Do", content: "This is my first to do item", urgent: false, done: false
ToDo.create title: "Second To Do", content: "This is my second to do item", urgent: false, done: false
ToDo.create title: "Third To Do", content: "This is my third to do item", urgent: true, done: false
ToDo.create title: "Fourth To Do", content: "This is my Fourth to do item", urgent: true, done: false