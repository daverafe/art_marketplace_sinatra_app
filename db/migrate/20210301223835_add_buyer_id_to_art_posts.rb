class AddBuyerIdToArtPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :art_posts, :buyer_id, :integer
  end
end
