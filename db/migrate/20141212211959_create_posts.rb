class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.text :excerpt
      t.timestamps
    end
  end
end
