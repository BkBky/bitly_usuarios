get '/short_url/:url_id' do
  p url = Url.find(params[:url_id])
  #redirigir al sitio de la url, usando long_url
  #redirect
  if url
    url.click_count += 1
    url.save
    #url.update(click_count: click_count += 1)
  end
  long = url.long_url
  redirect to("#{long}")
 # redirect to("https://google.com")
end

# e.g., /q6bda
get '/:short_url' do
  @ulr = Url.all
  erb :list_url
end

post '/urls' do
  # crea una nueva Url
  word_url  = params[:word_url]

  # here we send the input to model/url.rb /self.valid_url?(url) and we receive the result wiuth variable 'validate_result'
  p validate_result = Url.valid_url?(word_url)
  #p validate_id = logged_in?

  if validate_result == true
    logged_in?
    #logged_in? is method from 'helpers/user.rb'
    if logged_in?
      #here I associated the new long url with their user_id
      ulr = Url.create(long_url: word_url, user_id: current_user.id)
      ulr.valid?
      redirect to("/secret")
    else
      #this code if use when i dont have an logged user, but wheb the log url was validated
      ulr = Url.create(long_url: word_url)
      ulr.valid?
      redirect to("/short_url")
    end

  else 
    session[:error_newurl] = 'Tienes que introducir tu url con: http://www.'
    redirect to("/")
  end
end