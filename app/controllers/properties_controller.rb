class PropertiesController < ApplicationController
	def show
		@proptery = Property.find(params[:id])
	end
	
end
