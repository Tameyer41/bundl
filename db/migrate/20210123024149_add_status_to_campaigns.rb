class AddStatusToCampaigns < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :status, :boolean
  end
end
