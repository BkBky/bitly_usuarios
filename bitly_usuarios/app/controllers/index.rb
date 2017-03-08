
get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

get '/register' do
  erb :create_count
end

get '/login' do
  erb :login    
end