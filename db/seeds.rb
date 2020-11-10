# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

account1 = Account.create(username: "tomHolland", password: "password", email: "tomHolland@gmail.com", usertype: "client")
residence1 = Residence.create(address: "123 Tommy Lane", residence_type: "House", city: "Huntington Beach", state: "California", number_of_bedrooms: 8, number_of_bathrooms: 12, client_id: 1)

account2 = Account.create(username: "carlLosier", password: "password", email: "carlLosier@gmail.com", usertype: "maid")


account3 = Account.create(username: "maryLouise", password: "password", email: "maryLouise@gmail.com", usertype: "client")
residence1 = Residence.create(address: "321 Louise Lane", residence_type: "House", city: "Long Beach", state: "California", number_of_bedrooms: 4, number_of_bathrooms: 3, client_id: 2)

account4 = Account.create(username: "dianaLaner", password: "password", email: "dianaLaner@gmail.com", usertype: "maid")