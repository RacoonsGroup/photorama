# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  Template.create([{name: 'Default', layout_name: 'default'}, {name: 'Red', layout_name: 'red'}, {name: 'GrayRed', layout_name: 'gray_red'}])