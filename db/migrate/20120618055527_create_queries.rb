class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.integer :user_id
      t.integer :command_id
      t.string :input

      t.timestamps
    end
    
    add_index :queries, :user_id
    add_index :queries, :command_id
  end
end
