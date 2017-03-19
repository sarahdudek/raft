class Group < ActiveRecord::Base
  # invitable named_by: :name

  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :events

  belongs_to :admin, foreign_key: :admin_id

  validates :admin_id, :name, presence: true

end
