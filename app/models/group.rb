class Group < ActiveRecord::Base
  validates :user_id, presence: true
  belongs_to :user
  has_many :group_joins
end
