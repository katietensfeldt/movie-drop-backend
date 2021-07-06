# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rapunzel = User.create(name: "Rapunzel", username: "rapunzel2011", email: "rapunzel@gmail.com", image: "https://static.wikia.nocookie.net/disney/images/a/ae/Profile_-_Rapunzel.jpeg/revision/latest/top-crop/width/360/height/360?cb=20190312015421", password: "password")
snow_white = User.create(name: "Snow White", username: "apple-eater1938", email: "snowwhite@gmail.com", image: "https://static.wikia.nocookie.net/disneyheroines/images/e/e5/Snowy_White.jpg/revision/latest?cb=20111224025033", password: "password")
ariel = User.create(name: "Ariel", username: "mermaidhair89", email: "ariel@gmail.com", image: "https://lumiere-a.akamaihd.net/v1/images/image_c09181b9.jpeg?region=0,0,600,600", password: "password")
tiana = User.create(name: "Tiana", username: "beignetqueen09", email: "tiana@gmail.com", image: "https://bckonline.com/wp-content/uploads/2018/09/Tiana-1-750x750.jpg", password: "password")
cinderella = User.create(name: "Cinderella", username: "princesspumpkin55", email: "cinderella@gmail.com", image: "https://noguiltlife.com/wp-content/uploads/2019/06/cinderella-e1560445208596.jpeg", password: "password")
stitch = User.create(name: "Stitch", username: "troublemaker626", email: "stitch@gmail.com", image: "https://i.pinimg.com/originals/98/2b/29/982b29094dd09e127a8a9765cc718b75.png", password: "password")

Friendship.create(sender_id: rapunzel.id, recipient_id: snow_white.id, confirmed: true)
Friendship.create(sender_id: rapunzel.id, recipient_id: ariel.id, confirmed: false)
Friendship.create(sender_id: tiana.id, recipient_id: rapunzel.id, confirmed: true)
Friendship.create(sender_id: cinderella.id, recipient_id: rapunzel.id, confirmed: false)
Friendship.create(sender_id: snow_white.id, recipient_id: ariel.id, confirmed: true)
Friendship.create(sender_id: snow_white.id, recipient_id: tiana.id, confirmed: false)
Friendship.create(sender_id: cinderella.id, recipient_id: snow_white.id, confirmed: true)
Friendship.create(sender_id: ariel.id, recipient_id: tiana.id, confirmed: true)
Friendship.create(sender_id: ariel.id, recipient_id: cinderella.id, confirmed: false)
Friendship.create(sender_id: tiana.id, recipient_id: cinderella.id, confirmed: true)

# princess and the frog
Suggestion.create(omdb_api_id: "tt0780521", sender_id: tiana.id, recipient_id: rapunzel.id)
Suggestion.create(omdb_api_id: "tt0780521", sender_id: tiana.id, recipient_id: ariel.id)
Suggestion.create(omdb_api_id: "tt0780521", sender_id: tiana.id, recipient_id: cinderella.id)
# snow white and the seven dwarves
Suggestion.create(omdb_api_id: "tt0029583", sender_id: snow_white.id, recipient_id: rapunzel.id)
Suggestion.create(omdb_api_id: "tt0029583", sender_id: snow_white.id, recipient_id: ariel.id)
Suggestion.create(omdb_api_id: "tt0029583", sender_id: snow_white.id, recipient_id: cinderella.id)
# tangled
Suggestion.create(omdb_api_id: "tt0398286", sender_id: rapunzel.id, recipient_id: snow_white.id)
Suggestion.create(omdb_api_id: "tt0398286", sender_id: rapunzel.id, recipient_id: tiana.id)
# little mermaid
Suggestion.create(omdb_api_id: "tt0097757", sender_id: ariel.id, recipient_id: snow_white.id)
Suggestion.create(omdb_api_id: "tt0097757", sender_id: ariel.id, recipient_id: tiana.id)
# cinderella
Suggestion.create(omdb_api_id: "tt0042332", sender_id: cinderella.id, recipient_id: snow_white.id)
Suggestion.create(omdb_api_id: "tt0042332", sender_id: cinderella.id, recipient_id: tiana.id)
# emperor's new groove
Suggestion.create(omdb_api_id: "tt0120917", sender_id: tiana.id, recipient_id: rapunzel.id)
# lilo and stitch
Suggestion.create(omdb_api_id: "tt0275847", sender_id: snow_white.id, recipient_id: rapunzel.id)