class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
