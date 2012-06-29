class AddBookmarkletBooleanToCommand < ActiveRecord::Migration
  def change
    add_column :commands, :bookmarklet, :boolean, :default => false
  end
end
