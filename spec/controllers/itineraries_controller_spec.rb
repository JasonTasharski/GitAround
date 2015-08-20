require 'rails_helper'

RSpec.describe ItinerariesController, type: :controller do

  before do
    user_params = Hash.new
    user_params[:username] = FFaker::Name.first_name
    user_params[:email] = FFaker::Internet.email
    user_params[:password] = "password"
    user_params[:avatar] = "http://e4e.herokuapp.com/assets/blank_avatar.png"
    user_params[:hometown] = "San Francisco"
    @current_user = User.create(user_params)
    allow_any_instance_of(ItinerariesController).to receive(:current_user).and_return(@current_user)
  end

	describe "GET #index" do
		it "should render :index view" do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe "GET #new" do
		it "should render :new view" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe "POST #create" do
		context "success" do
			it "should add new itinerary to current user" do
				itineraries_count = @current_user.itineraries.count
				post :create, itinerary: {title: "arghjkhs", description: "fuck everything this is a terrible test"}
				expect(response.status).to be(302)
			end
		end
	end
end
