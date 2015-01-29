class MoveContentToBlock < ActiveRecord::Migration
  def change
    remove_column :projects, :content
    remove_column :posts, :content
    remove_column :posts, :excerpt
    add_column :blocks, :content, :text
  end
end
