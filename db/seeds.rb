rapunzel = User.create(name: "Rapunzel", username: "rapunzel2011", email: "rapunzel@gmail.com", image: "https://lumiere-a.akamaihd.net/v1/images/ct_rapunzel_upcportalreskin_20694_01be5a18.jpeg?region=0,0,330,330", password: "password")
snow_white = User.create(name: "Snow White", username: "apple-eater1938", email: "snowwhite@gmail.com", image: "https://lumiere-a.akamaihd.net/v1/images/open-uri20150422-20810-10dy163_26bdf0e8.jpeg?region=0%2C0%2C600%2C600", password: "password")
ariel = User.create(name: "Ariel", username: "mermaidhair89", email: "ariel@gmail.com", image: "https://lumiere-a.akamaihd.net/v1/images/image_c09181b9.jpeg?region=0,0,600,600", password: "password")
tiana = User.create(name: "Tiana", username: "beignetqueen09", email: "tiana@gmail.com", image: "https://bckonline.com/wp-content/uploads/2018/09/Tiana-1-750x750.jpg", password: "password")
cinderella = User.create(name: "Cinderella", username: "princesspumpkin55", email: "cinderella@gmail.com", image: "https://noguiltlife.com/wp-content/uploads/2019/06/cinderella-e1560445208596.jpeg", password: "password")
stitch = User.create(name: "Stitch", username: "troublemaker626", email: "stitch@gmail.com", image: "https://i.pinimg.com/originals/98/2b/29/982b29094dd09e127a8a9765cc718b75.png", password: "password")
kuzco = User.create(name: "Emperor Kuzco", username: "llama-face", email: "kuzco@gmail.com", image: "https://res.cloudinary.com/depn6c2c3/image/upload/v1625772476/c7iupy6gptlhujzqwnbu.jpg", password: "password")

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