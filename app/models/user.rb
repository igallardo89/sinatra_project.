class User < ActiveRecord::Base
   has_many :meditations
   validates_presence_of :email, :username, :password
   has_secure_password  

   def slug
      self.username.downcase.gsub(" ", "-")
   end

   def find_by_slug(slug)
      self.all.find{|username| username.slug == slug}
   end   
 
end



