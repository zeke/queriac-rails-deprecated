class RenameCommandUrlToScript < ActiveRecord::Migration
  def up
    rename_column :commands, :url, :script
    remove_column :commands, :use_http_post
    remove_column :commands, :use_url_encoding
    remove_column :commands, :bookmarklet
  end

  def down
    rename_column :commands, :script, :url
    add_column :commands, :use_http_post, :boolean, :default => false
    add_column :commands, :use_url_encoding, :boolean, :default => false
    add_column :commands, :bookmarklet, :boolean, :default => false
  end
end