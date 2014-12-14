class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.string :filetype
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
