# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Mood.destroy_all
Music.destroy_all

Mood.create!([
  { name: "Happy", emoji: "😀" },
  { name: "Sad", emoji: "😢" },
  { name: "Angry", emoji: "😠" },
  { name: "Surprised", emoji: "😲" },
  { name: "Love", emoji: "😍" },
  { name: "Cool", emoji: "😎" }
])

Music.create!([
  {
    title: "Happy Song",
    album: "Feel Good",
    artist: "Joyful Band",
    lyrics: "Singing in the sunshine...",
    cover_url: "https://f4.bcbits.com/img/a2218107711_16.jpg",
    mood_id: 1
  },
  {
    title: "Blue Moon",
    album: "Melancholy Nights",
    artist: "Sad Singer",
    lyrics: "Under the blue moon, I wander...",
    cover_url: "https://f4.bcbits.com/img/a2218107711_16.jpg",
    mood_id: 2
  },
  {
    title: "Rage Anthem",
    album: "Fire Inside",
    artist: "Angry Voices",
    lyrics: "Let it all out, scream and shout...",
    cover_url: "https://f4.bcbits.com/img/a2218107711_16.jpg",
    mood_id: 3
  }
])

puts "Musics créées !  "
