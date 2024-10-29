class HomeController < ApplicationController
	#before_action :authenticate_user!
	def index
		@proptery = Property.all
	end
end
