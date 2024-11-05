class Property < ApplicationRecord
	validates :name,  :headline, :description, :address_1, :city, :state, :countroy, presence: true
	monetize :price_cents, allow_nil: true
	has_many_attached :images
	has_many :reviews

	def final_average
		self.reviews.average(:final_rating).to_f
	end
end
