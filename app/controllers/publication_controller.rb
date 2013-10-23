class PublicationController < ApplicationController
	def index
		@query = params[:q]
		if @query
			render json: SolrPublication::get_publications(@query)
		end
	end

	def show
		@publicationId = params[:id]
		@jsondata = Publication::testj
		render json: @jsondata
	end
end
