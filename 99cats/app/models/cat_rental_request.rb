class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"]}
  validate :overlapping_approved_requests

  belongs_to :cat, dependent: :destroy

  def approve!
    CatRentalRequest.transaction do
      self.overlapping_approved_requests
      self.overlapping_pending_requests
      self.status = "APPROVED"
    end
  end

  def deny!
    self.status = "DENIED"
  end

  def overlapping_requests
    # requests = self.cat.cat_rental_requests
    # debugger

    rentals = CatRentalRequest.where.not({id: self.id})
      .where({cat_id: self.cat_id})
      .where.not("start_date > ? OR end_date < ?", self.end_date, self.start_date)
    rentals
  end


  def overlapping_approved_requests
    rentals = overlapping_requests.where(status: "APPROVED")
    unless rentals.empty?
      errors[:base] << "Overlapping approved requests"
    end
  end

  def overlapping_pending_requests
    rentals = overlapping_requests.where(status: "PENDING")
    unless rentals.empty?
      errors[:base] << "Overlapping pending requests"
    end
  end

end
