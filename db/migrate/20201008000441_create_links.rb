class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.references :employee, index: true
      t.integer :reference, index: true
      t.timestamps
    end
  end
end
