class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property, counter_cache: true
  validates :content, presence: true
  validates :cleanliness_rating, inclusion: 1..5 
  validates :accuracy_rating, inclusion: 1..5 
  validates :checkin_rating, inclusion: 1..5 
  validates :location_rating, inclusion: 1..5 
  validates :value_rating, inclusion: 1..5 
  validates :communication_rating , inclusion: 1..5 
 after_commit :update_final_rating, on: [:create, :update]
 def update_final_rating
  total_final_rating = 
  cleanliness_rating+
  accuracy_rating+
  checkin_rating+
  location_rating+
  communication_rating+
  value_rating
  update_column(:final_rating, total_final_rating.to_f/6)
 end

end
