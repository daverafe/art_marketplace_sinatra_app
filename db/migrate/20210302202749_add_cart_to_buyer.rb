class AddCartToBuyer < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :cart, :string
  end
end
