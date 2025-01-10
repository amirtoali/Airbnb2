class Property < ApplicationRecord
	validates :name,  :headline, :description, :address_1, :city, :state, :countroy, presence: true
	monetize :price_cents, allow_nil: true
	has_many_attached :images
	has_many :reviews
	has_many :wishlists, dependent: :destroy
    has_many :wishlistsed_users, through: :wishlists, source: :user, dependent: :destroy
    has_many :reservations, dependent: :destroy
    has_many :reserved_users, through: :reservations, source: :user, dependent: :destroy
    has_rich_text :description

    def  availbilty
		  upcomming_reservations = self.reservations.upcoming_reservation.first
	    current_reservations = self.reservations.current_reservation.first
			if upcomming_reservations.nil? && current_reservations.nil?
				Date.tomorrow..Date.today+30.day
			elsif upcomming_reservations.nil?
				  current_reservations.checkout..current_reservations.checkout+30.days
		  elsif current_reservations.nil?
		    	 upcomming_reservations.checkout..upcomming_reservations.checkout+30.day
		  else
		    	current_reservations.checkout..upcomming_reservations.checkin
		  end
    end
    def formatted_date_range
	    start_date = self.availbilty.begin
	    end_date = self.availbilty.end
	    if start_date.month == end_date.month && start_date.year == end_date.year
	                      "#{start_date.strftime('%b')} #{start_date.day} – #{end_date.day}"
	     else
		     "#{start_date.strftime('%b %d')} – #{end_date.strftime('%b %d')}"
		 end
    end

	def final_average
		self.reviews.average(:final_rating).to_f
	end
	def wishlisted_by?(user=nil)
		return if user.nil?
		wishlistsed_users.include?(user)
	end
end
