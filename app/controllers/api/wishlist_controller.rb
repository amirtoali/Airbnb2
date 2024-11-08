
class Api::WishlistController< ApplicationController
	protect_from_forgery with: :null_session
	def create
	 wishlist = Wishlist.new(wishlist_params)
	  if wishlist.save
	  	byebug
	      render json: {wishlist_id: wishlist.id, status: :ok}
	   end
	end
	def destroy
		wishlist = Wishlist.find(params[:id])
	  if wishlist.destroy
	      #render status: 200
	   end
	end
	private
	def wishlist_params
		# property_id=params[:propetry_id]
		  params.require(:wishlist).permit(:user_id, :property_id)
	end
 end