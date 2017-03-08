class User < ActiveRecord::Base
  # ej. User.authenticate('fernando@codea.mx', 'qwerty')
  validates :email, uniqueness: true, presence: true 
  validates :password, presence: true
  has_many :urls
  def self.authenticate(email, password)
    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil
    User.find_by(email: email, password: password)

  end

end