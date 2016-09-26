class Comment < ActiveRecord::Base

  validates :body, :user, :commentable, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :user, inverse_of: :comments

  def comment_type
    self.commentable_type
  end
end
