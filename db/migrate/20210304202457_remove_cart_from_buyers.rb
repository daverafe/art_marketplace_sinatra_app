class RemoveCartFromBuyers < ActiveRecord::Migration[5.2]
  def change
    remove_column :buyers, :cart 
  end
end
