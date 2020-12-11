class User < ActiveRecord::Base
   has_many :meditations
   validates_presence_of :email, :username, :password
   has_secure_password  

end
