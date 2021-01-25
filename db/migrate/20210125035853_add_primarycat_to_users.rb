class AddPrimarycatToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :primarycat, :string
  end
end
