class Favorite < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validate :contact_not_in_list
  belongs_to :user
  belongs_to :contact


  def contact_not_in_list
    if User.find(self.user_id).shared_contacts.where(id: self.contact_id).empty? ||
      User.find(self.user_id).contacts.where(id: self.contact_id).empty?
      errors[:contact_not_in_list] << "That contact is not in your list!"
    end
  end
end
