post "/restaurants" do
  ensure_login
  @restaurant = Restaurant.new(params[:restaurant])

  if @restaurant.save
    redirect "/users/#{current_user.id}"
  else
    erb :"/users/show"
  end
end

delete "/restaurants/:id" do
  @user = current_user
  @restaurants = @user.restaurants
  restaurant = Restaurant.find(params[:id])
  restaurant.destroy
  redirect "/users/#{current_user.id}"
end


