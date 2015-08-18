# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "test", email: "test@test.com", password: "test", avatar: "")
5.times do 
	user_params = Hash.new
	user_params[:username] = FFaker::Name.first_name
	user_params[:email] = FFaker::Internet.email
	user_params[:password] = "password"
	user_params[:avatar] = ""
	@user = User.create!(user_params)
end
User.all.each do |user|
  3.times do
    itinerary_params = Hash.new
    itinerary_params[:title] = FFaker::HipsterIpsum.sentence(1)
    itinerary_params[:description] = FFaker::HipsterIpsum.sentence(2)
    itinerary_params[:cover] = "knoe pickchur"
    @itinerary = user.itineraries.create!(itinerary_params)
  end
end