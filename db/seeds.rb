require "faker"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


  Actor.create(
    first_name: "Tom",
    last_name: "Cruise",
    image: "https://www.bing.com/th/id/OIP.iXeOjzyP6YdLfmR7A5c1pAHaIy?w=160&h=211&c=8&rs=1&qlt=90&o=6&dpr=2&pid=3.1&rm=2",
    known_for: "Top Gun"
  )
