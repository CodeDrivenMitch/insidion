class AddUserIdToUser < ActiveRecord::Migration
  def up
    add_column :blocks, :user_id, :integer
  end

  def down
    remove_column :blocks, :user_id, :integer
  end
end
