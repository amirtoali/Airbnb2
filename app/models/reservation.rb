class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :property
  scope :upcoming_reservation, -> { where("checkin > ?", Date.today).order(:checkin)}
  scope :current_reservation, -> { where("checkout > ?",Date.today).where("checkin < ?",Date.today).order(:checkin) }
end
