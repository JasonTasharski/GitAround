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
    itinerary_params[:cover] = "http://media.giphy.com/media/JKswczDIOEG2Y/giphy.gif"
    @itinerary = user.itineraries.create!(itinerary_params)
  end
end
Itinerary.all.each do |itinerary|
  3.times do
    item_params = Hash.new
    item_params[:activity_name] = FFaker::HipsterIpsum.sentence(1)
    item_params[:description] = FFaker::HipsterIpsum.sentence(2)
    num = rand(3)
    if num == 1
      item_params[:category] = "sleep"
    elsif num == 2
      item_params[:category] = "eat"
    elsif num == 0
      item_params[:category] = "play"
    end
    item_params[:lat] = (37.74 + (rand() * 0.04))
    item_params[:lng] = ((-122.5) + (rand() * 0.1))
    @item = itinerary.items.create!(item_params)
  end
end