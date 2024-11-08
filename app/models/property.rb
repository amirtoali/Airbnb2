class Property < ApplicationRecord
	validates :name,  :headline, :description, :address_1, :city, :state, :countroy, presence: true
	monetize :price_cents, allow_nil: true
	has_many_attached :images
	has_many :reviews
	has_many :wishlists, dependent: :destroy
    has_many :wishlistsed_users, through: :wishlists, source: :user, dependent: :destroy

	def final_average
		self.reviews.average(:final_rating).to_f
	end
	def wishlisted_by?(user=nil)
		return if user.nil?
		wishlistsed_users.include?(user)
	end
end
