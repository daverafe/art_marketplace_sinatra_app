class CreateArtPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :art_posts do |t|
      t.string :title
      t.string :description
      t.integer :price 
      t.integer :seller_id
    end
  end
end
