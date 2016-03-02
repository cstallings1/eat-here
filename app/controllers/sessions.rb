get '/session/new' do
  if request.xhr?
    erb :"_user_login", layout: false
  else
    erb :"sessions/login"
  end
end

post '/session' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @message = "Sorry, invalid password"
    erb :"sessions/login"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end


