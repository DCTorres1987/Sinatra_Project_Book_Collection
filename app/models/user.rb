class User < ActiveRecord::Base
    has_secure_password
    has_many :books, through: :reviews
    has_many :reviews
    
end