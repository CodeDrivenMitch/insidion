class CreateBlockImages < ActiveRecord::Migration
  def change
    create_table :block_images do |t|
      t.integer :block_id
      t.integer :upload_id
      t.timestamps
    end
  end
end
