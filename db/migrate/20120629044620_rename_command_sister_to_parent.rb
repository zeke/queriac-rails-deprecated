class RenameCommandSisterToParent < ActiveRecord::Migration
  def up
    rename_column :commands, :sister_id, :parent_id
  end

  def down
    rename_column  :commands, :parent_id, :sister_id
  end
end
