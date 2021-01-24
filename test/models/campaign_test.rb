# == Schema Information
#
# Table name: campaigns
#
#  id            :bigint           not null, primary key
#  hashid        :string
#  link          :string
#  paymentamount :float
#  paymenttype   :string
#  slug          :string
#  status        :boolean
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_campaigns_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
