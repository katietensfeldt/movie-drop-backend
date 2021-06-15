# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "John Doe", username: "theunknown", email: "john@test.com", password: "password")
User.create(name: "Jane", username: "itsjane", email: "jane@test.com", password: "password")

Friendship.create(sender_id: 3, recipient_id: 2)
Friendship.create(sender_id: 1, recipient_id: 5)
Friendship.create(sender_id: 5, recipient_id: 4)
Friendship.create(sender_id: 4, recipient_id: 2)
Friendship.create(sender_id: 2, recipient_id: 5)

Suggestion.create(omdb_api_id: "tt0093779", sender_id: 1, recipient_id: 5)
Suggestion.create(omdb_api_id: "tt0371724", sender_id: 2, recipient_id: 3)
Suggestion.create(omdb_api_id: "tt0398286", sender_id: 4, recipient_id: 2)
Suggestion.create(omdb_api_id: "tt2883512", sender_id: 2, recipient_id: 4)
Suggestion.create(omdb_api_id: "tt0076759", sender_id: 5, recipient_id: 1)
Suggestion.create(omdb_api_id: "tt4154796", sender_id: 1, recipient_id: 5)