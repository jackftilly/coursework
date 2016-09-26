# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  body       :text             not null
#  complete   :boolean          default(FALSE)
#  private    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base

  validates :user, :body, presence: true
  belongs_to :user

  def private?
    self.private
  end

  def completed?
    self.complete
  end

  has_many :comments, as: :commentable


end
