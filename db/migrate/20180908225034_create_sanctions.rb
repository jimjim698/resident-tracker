class CreateSanctions < ActiveRecord::Migration[5.2]
  def change
    create_table :sanctions do |t|
      t.string :name
      t.integer :resident_id
    end 
  end
end
