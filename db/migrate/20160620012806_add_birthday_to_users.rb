class AddBirthdayToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.date :birthday
      t.string :introduction
      t.string :location
      t.string :website
    end
  end
end
