class AddInstagramhandleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :instagramhandle, :string
  end
end
