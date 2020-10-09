class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.string :email, index: true
      t.integer :level, index: true
      t.timestamps
    end
  end
end
