class AddPersonalDetailsToUser < ActiveRecord::Migration
  def change
    change_table :users do |b|
      b.string :first_name
      b.string :last_name
      b.string :username
      b.string :gender
      b.string :function
      b.text :biography
      b.date :birthday
      b.string :city
      b.string :country
    end

    add_index :users, :username, :unique => true
  end
end
