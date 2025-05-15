# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# D'abord supprimer les strolls, puis dogsitters/dogs, puis cities
Stroll.destroy_all
Dogsitter.destroy_all
Dog.destroy_all
City.destroy_all

# Création de 5 villes
cities = 5.times.map do
  City.create!(city_name: Faker::Address.city)
end

# Création de dogsitters et de chiens par ville
all_dogsitters = []
all_dogs = []
cities.each do |city|
  dogsitters = 3.times.map { Dogsitter.create!(name: Faker::Name.first_name, city: city) }
  dogs = 5.times.map { Dog.create!(name: Faker::Creature::Dog.name, city: city) }
  all_dogsitters += dogsitters
  all_dogs += dogs
  # Création de promenades cohérentes (dogsitter et dog de la même ville)
  5.times do
    Stroll.create!(dogsitter: dogsitters.sample, dog: dogs.sample)
  end
end
