class AddHashidToCampaigns < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :hashid, :string
  end
end
