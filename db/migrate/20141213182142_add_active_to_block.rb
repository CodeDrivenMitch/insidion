class AddActiveToBlock < ActiveRecord::Migration
  def change
    change_table :blocks do |b|
      b.boolean :active
    end
  end
end
