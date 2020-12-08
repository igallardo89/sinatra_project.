class User < ActiveRecord::Base
   has_many :meditations
   has_secure_password    
end
