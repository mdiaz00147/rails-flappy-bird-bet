# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(full_name:'chris', username:'cr7', email:'crhis@ace.off', password: '121212')
User.create(full_name:'mario', username:'mdiaz', email:'mario@ace.off', password: '121212')
User.create(full_name:'kevin', username:'kevpoll', email:'kevin@ace.off', password: '121212')
User.create(full_name:'sam', username:'samaba', email:'sam@ace.off', password: '121212')

Plan.create(code: 11, name: '3 Games', price_units: '30', price_cents: '00', tickets: 3)
