class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :link
      t.string :paymenttype
      t.float :paymentamount

      t.timestamps
    end
  end
end
