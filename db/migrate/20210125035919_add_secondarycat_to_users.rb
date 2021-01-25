class AddSecondarycatToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :secondarycat, :string
  end
end
