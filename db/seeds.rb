require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?

  50.times do
    User.create(
      email: "#{Faker::Internet.email}",
      password: "password",
      password_confirmation: "password",
      firstname: "#{Faker::Name.first_name}",
      lastname: "#{Faker::Name.last_name}",
      admin: false
    )
  end
end

  # user_count = User.count
  # movie_count = Movie.count

  # 100.times do
  #   user_offset = rand(user_count)
  #   movie_offset = rand(movie_count)
  #   Review.create(
  #     content: Faker::Lorem.sentence(3),
  #     user: User.offset(user_offset).first,
  #     movie: Movie.offset(movie_offset).first
  #   )
  # end