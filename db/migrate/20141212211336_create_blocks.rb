class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :title
      t.string :blockable_type
      t.integer :blockable_id
      t.timestamps
    end
  end
end
