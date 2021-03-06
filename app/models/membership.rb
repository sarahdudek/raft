class Membership < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :group, foreign_key: :group_id

  validates :group_id, :user_id, presence: true
end
