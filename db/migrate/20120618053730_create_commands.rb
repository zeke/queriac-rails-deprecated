class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.integer :user_id
      t.integer :sister_id
      t.string :keyword
      t.text :url
      t.string :domain
      t.string :name
      t.text :description
      t.boolean :shared, :default => true
      t.boolean :use_http_post, :default => false
      t.boolean :use_url_encoding, :default => false
      t.timestamps
    end
    
    add_index :commands, :user_id
    add_index :commands, :sister_id
    add_index :commands, :keyword
  end
end
