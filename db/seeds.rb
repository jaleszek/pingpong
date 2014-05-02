# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Gist.destroy_all
Gist.create(name: 'gist1', owner_id: 1, type_id: 1, url: 'https://gist.github.com/jaleszek/9772408')
Gist.create(name: 'gist2', owner_id: 1, type_id: 1, url: 'https://gist.github.com/jaleszek/9455426')
Gist.create(name: 'gist2', owner_id: 1, type_id: 1, url: 'https://gist.github.com/jaleszek/9451135')
