class User < ActiveRecord::Base
    has_many: mediation
    has_secure_password
end
