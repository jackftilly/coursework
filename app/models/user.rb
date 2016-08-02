class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true
  has_many :contacts, dependent: :destroy
  has_many :comments, as: :external
  has_many :contact_shares, dependent: :destroy
  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact
  has_many :groups
  has_many :favorites
  has_many :favorited,
    through: :favorites,
    source: :contact
end
