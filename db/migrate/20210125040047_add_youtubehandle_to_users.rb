class AddYoutubehandleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :youtubehandle, :string
  end
end
