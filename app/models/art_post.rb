class ArtPost < ActiveRecord::Base
    belongs_to :seller 
    belongs_to :buyer 
end