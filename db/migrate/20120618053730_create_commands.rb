class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :user_id
      t.string :integer
      t.string :sister_id
      t.string :integer
      t.string :name
      t.string :keyword
      t.text :url
      t.string :description
      t.string :text
      t.string :shared
      t.string :boolean
      t.string :use_http_post
      t.string :boolean
      t.string :use_url_encoding
      t.string :boolean

      t.timestamps
    end
  end
end
