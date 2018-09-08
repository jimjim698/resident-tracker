class AddColumnsToResidents < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :age, :integer
    add_column :residents, :room_number, :integer 
  end
end
