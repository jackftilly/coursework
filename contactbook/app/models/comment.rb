class Comment < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :external, polymorphic: true
end
