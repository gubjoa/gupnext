class PublicationController < ApplicationController
	def index
    query = params[:q]
    params[:start] ? start = params[:start] : start = 0
    params[:rows] ? rows = params[:rows] : rows = 10

    if query
			render json: SolrPublication::get_publications(query, start, rows)
		end
	end

  def get_by_solr
    pubid = params[:id]
    if pubid
			render json: SolrPublication::get_publication(pubid)
		end
  end
  
  
	def show
		@publicationId = params[:id]
		@jsondata = Publication::testj
		render json: @jsondata
	end
  
  
  def test
		id = params[:id]
    
    @publication = Publication.find(id)
    @addresses = Address.find_by(publication_id: id)
    puts @addresses.inspect

  end
end
