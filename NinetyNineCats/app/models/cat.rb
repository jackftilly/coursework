class Cat < ActiveRecord::Base
  validates :birthdate, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: ["ginger", "black", "white"]}
  validates :sex, inclusion: {in: ["M", "F"]}

  has_many :cat_rental_requests

  def age
    Time.now - self.birthdate
  end

end
