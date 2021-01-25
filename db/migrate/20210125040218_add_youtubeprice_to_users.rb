class AddYoutubepriceToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :youtubeprice, :integer
  end
end
