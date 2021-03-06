class Buyer < ActiveRecord::Base
    has_secure_password 
    has_many :art_posts 
    validates :email, :username, :password, presence: true
    validates :email, uniqueness: {case_sensitive: false}
end

