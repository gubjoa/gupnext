class PublicationController < ApplicationController
	def index
		
	end

	def show
		@publicationId = params[:id]
		@jsondata = Publication::testj
		render json: @jsondata
	end
end
