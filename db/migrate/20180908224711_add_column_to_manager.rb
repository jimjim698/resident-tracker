class AddColumnToManager < ActiveRecord::Migration[5.2]
  def change
    add_column :managers, :password_digest, :string
    add_column :managers, :email, :string
    
  end
end
