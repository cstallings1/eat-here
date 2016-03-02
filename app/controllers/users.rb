get "/users/new" do
  if request.xhr?
    erb :"_user_register", layout: false
  else
    erb :"users/new"
  end
end

post "/users" do
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/:id' do
  @user = current_user
  @restaurants = @user.restaurants
  @google_api_key = ENV['GOOGLE_MAPS_API_KEY']
  erb :"users/show"
end

post '/users/:id' do
  @user = current_user
  @restaurants = @user.restaurants
  @google_api_key = ENV['GOOGLE_MAPS_API_KEY']
  client = Yelp::Client.new({ consumer_key: ENV['CONSUMER_KEY'],
                            consumer_secret: ENV['CONSUMER_SECRET'],
                            token: ENV['TOKEN'],
                            token_secret: ENV['TOKEN_SECRET'],
                          })

  location = params[:location]
  name = params[:name]
  params = {term: name,
            limit: 5,
  }
  response = client.search(location, params)
  @businesses = response.businesses
  if request.xhr?
   erb :"_business_short_display", layout: false, locals: {businesses: @businesses, user: @user}
  else
    erb :"/users/show"
  end
end



