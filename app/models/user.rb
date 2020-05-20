class User < ActiveRecord::Base
    # redenders gem that encrypts the password
    has_secure_password
    has_many :books, through: :reviews
    has_many :reviews
 
    
end