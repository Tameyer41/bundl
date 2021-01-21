# == Schema Information
#
# Table name: campaigns
#
#  id            :bigint           not null, primary key
#  link          :string
#  paymentamount :float
#  paymenttype   :string
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
class Campaign < ApplicationRecord
  belongs_to :user
  has_rich_text :description
end
