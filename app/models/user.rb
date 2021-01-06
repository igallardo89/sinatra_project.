class User < ActiveRecord::Base
   has_many :meditations
   validates :username, uniqueness: true
   validates :email, uniqueness: true
   validates_presence_of :email, :username,  :password
   has_secure_password  
  
   def slug
      self.username.downcase.gsub(" ", "-")
   end

   def self.find_by_slug(slug)
      self.all.find{|username| username.slug == slug}
   end   
end



