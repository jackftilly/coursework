class Todo < ActiveRecord::Base
  validates :body, :title, presence: true
end
