class AddTwitterAttrsToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :integer
    add_column :users, :nickname, :string
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :image, :string
    add_column :users, :description, :string
    add_column :users, :website, :string
    
    add_index :users, :provider
    add_index :users, :uid
    add_index :users, :nickname
  end
end
