class User < ActiveRecord::Base

has_many :memberships
has_many :groups, through: :memberships
has_many :events, through: :groups
has_many :rankings
has_many :hosted_groups, foreign_key: :admin_id, source: "User"

has_secure_password

validates :first_name, :last_name, :username, :email, presence: true
validates :email, :username, uniqueness: true
end
