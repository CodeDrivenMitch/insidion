class ExtendProject < ActiveRecord::Migration
  def change
    add_column :projects, :start_date, :date
    add_column :projects, :end_date, :date
    add_column :projects, :time_spent, :integer
    add_column :projects, :url, :string
  end
end
