class AddInstagrampriceToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :instagramprice, :integer
  end
end
