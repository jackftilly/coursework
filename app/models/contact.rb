class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validate :duplicate_email?
  belongs_to :user
  has_many :comments, as: :external
  has_many :contact_shares
  has_many :shared_users,
    through: :contact_shares,
    source: :user
  has_many :group_joins
  has_many :favorites

  def duplicate_email?
    unless user.contacts.all.where(email: self.email).empty?
      errors[:dup_emails] << "Duplicate email found"
    end
  end
end
