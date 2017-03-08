enable :sessions

#'before' to give autorization to login
before '/secret' do
  unless session[:id]
    session[:error] = "No has iniciado sesión"
    #i need to redirect to index to avoid go to /secret again
    redirect to '/'
  end
end

get "/secret" do
  @urls = Url.where(user_id: current_user.id)
  erb :secret
end



# Post for login
post '/login_form' do
  #I Obtain user inputs
  @email = params[:email]
  @password = params[:password]
   
  #I send the user input to models/user.rb to compare with database for authenticate
  valid_user = User.authenticate(@email, @password)
  
  if valid_user
    session[:id] = valid_user.id
    redirect to '/secret'
  else
    session[:incorrect_login] = "Email y/o password incorrectos"
    #@error_message_login = "Email y/o password incorrectos"
    redirect to '/login'
  end

end

#url for logout
get '/logout' do
  #I need to clear session to be clean it.
  session.clear
  session[:logoutm] = "Has cerrado sesión correctamente"
  redirect to '/'
end

