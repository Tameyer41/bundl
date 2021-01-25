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
class Campaign < ApplicationRecord
  extend FriendlyId
  friendly_id :hashid, use: :slugged
  before_validation :set_hashid, prepend: true, if: Proc.new{ |article| article.hashid.nil? }

    private

        def set_hashid
            self.hashid = SecureRandom.urlsafe_base64(10)
        end
  belongs_to :user
  has_rich_text :description
  has_many_attached :files
end
