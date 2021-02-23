class Seller < ActiveRecord::Base
    has_many :art_posts 
    has_secure_password 
end