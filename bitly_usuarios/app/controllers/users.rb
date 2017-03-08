post '/register_form' do
  # Capturamos los valores del formulario con 'params'
  name = params[:name]
  email = params[:email]
  password = params[:password]
  # p password = params[:password]

  # Creamos una instancia de la clase User con sus atributos necesarios
  user  = User.new(name: name, email: email, password: password)
  # Si el usuario se guardó en la DB, redirige a su perfil, de otra forma
  # vuelve a mostrar el formulario.
  if user.save
    #I declare message for used, I can see it on view/layout
    session[:successfull] = 'Cuenta creada exitosamente. Ahora puedes ingresar.'
    redirect to '/login'
  else
    session[:error_message_register] = 'Ya existe un usuario y/o contraseña. Intenta con otros datos.'
    redirect to '/register'
  end
  
end