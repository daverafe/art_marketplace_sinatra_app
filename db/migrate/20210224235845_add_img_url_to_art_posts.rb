class AddImgUrlToArtPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :art_posts, :img_url, :string 
  end
end
