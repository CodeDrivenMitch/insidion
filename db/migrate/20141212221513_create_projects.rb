class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :content
      t.timestamps
    end
  end
end
