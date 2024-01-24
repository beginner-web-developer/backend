# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(username: "eigen", name: "eigen")
Post.create(user_id: 1, title: "How to survive NUS?", tag: "Educational")
Subpost.create(user_id: 1, post_id: 1, body: "Stay strong and never give up!")

User.create(username: "cs_kid", name: "Sandy")
Post.create(user_id: 2, title: "Favourite Movie?", tag: "Entertainment")
Subpost.create(user_id: 2, post_id: 2, body: "Barbieeeee")
Subpost.create(user_id: 1, post_id: 2, body: "Avengers!")

User.create(username: "aikendueet", name: "Aiken")
Post.create(user_id: 3, title: "Inspirational Quotes", tag: "Educational")
Subpost.create(user_id: 3, post_id: 3, body: "What doesnt kill you makes you stronger.")
Post.create(user_id: 3, title: "Trending News", tag: "News")
Subpost.create(user_id:3, post_id: 4, body: "Is Trump winning elections???")