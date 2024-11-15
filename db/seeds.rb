# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Temporary destroy_all
Evolution.destroy_all
EvolutionTransition.destroy_all

piglet = Evolution.create!(name: "Piglet")
pig = Evolution.create!(name: "Pig")
boar = Evolution.create!(name: "Boar")
mecha_pig = Evolution.create!(name: "Mecha Pig")
fat_boy = Evolution.create!(name: "Fat Boy")
roid_boar = Evolution.create!(name: "Roid Boar")

piglet.children << [pig, boar]
pig.children << [mecha_pig, fat_boy]
boar.children << [fat_boy, roid_boar]

# piglet -> pi`g ->` mecha pig
#               -> fatboy
#           boar -> fatboy
#                -> roidboar