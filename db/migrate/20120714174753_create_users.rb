class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :name
      t.string :location
      t.string :image
      t.string :description
      t.string :website

      t.timestamps
    end
    
    add_index :users, :nickname
  end
end
