class GroupJoin < ActiveRecord::Base
  validates :group_id, :contact_id, presence: true
  validate :repeat_join?
  belongs_to :group
  belongs_to :contact

  def repeat_join?
    unless GroupJoin.where(group_id: self.group_id, contact_id: self.contact_id).empty?
      errors[:repeat_join] << "There were two of the same join!"
    end
  end
end
