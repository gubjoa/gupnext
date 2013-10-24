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

	def create
		status = "200 OK"
		puts "============="
		puts params
		puts "============="
		render :nothing => true, :status => status
	end

	def update
		status = "200 OK"
		render :nothing => true, :status => status
	end

	def destroy

		status = "403"
		render :nothing => true, :status => status
	end
end
