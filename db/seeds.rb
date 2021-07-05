# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

katie = User.create(name: "Katie", username: "k10sfeldt", email: "katie@test.com", password: "password")
mike = User.create(name: "Mike", username: "lordascendant", email: "mike@test.com", password: "password")
dani = User.create(name: "Dani", username: "daniiscool", email: "dani@test.com", password: "password")
john = User.create(name: "John Doe", username: "theunknown", email: "john@test.com", password: "password")
jane = User.create(name: "Jane", username: "itsjane", email: "jane@test.com", password: "password")

Friendship.create(sender_id: katie.id, recipient_id: mike.id, confirmed: true)
Friendship.create(sender_id: katie.id, recipient_id: dani.id, confirmed: false)
Friendship.create(sender_id: john.id, recipient_id: katie.id, confirmed: true)
Friendship.create(sender_id: jane.id, recipient_id: katie.id, confirmed: false)
Friendship.create(sender_id: mike.id, recipient_id: dani.id, confirmed: true)
Friendship.create(sender_id: mike.id, recipient_id: john.id, confirmed: false)
Friendship.create(sender_id: jane.id, recipient_id: mike.id, confirmed: true)
Friendship.create(sender_id: dani.id, recipient_id: john.id, confirmed: true)
Friendship.create(sender_id: dani.id, recipient_id: jane.id, confirmed: false)
Friendship.create(sender_id: john.id, recipient_id: jane.id, confirmed: true)

# princess bride
Suggestion.create(omdb_api_id: "tt0093779", sender_id: 1, recipient_id: 2)
# hitchhikers guide to the galaxy
Suggestion.create(omdb_api_id: "tt0371724", sender_id: 2, recipient_id: 3)
# tangled
Suggestion.create(omdb_api_id: "tt0398286", sender_id: 4, recipient_id: 2)
# chef
Suggestion.create(omdb_api_id: "tt2883512", sender_id: 2, recipient_id: 4)
# star wars new hope
Suggestion.create(omdb_api_id: "tt0076759", sender_id: 5, recipient_id: 1)
# avengers end game
Suggestion.create(omdb_api_id: "tt4154796", sender_id: 1, recipient_id: 5)
# sandlot
Suggestion.create(omdb_api_id: "tt4154796", sender_id: 1, recipient_id: 5)