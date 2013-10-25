class PublicationController < ApplicationController
  def index
    query = params[:q]
    params[:start] ? start = params[:start] : start = 0
    params[:rows] ? rows = params[:rows] : rows = 10

    if query
      render json: SolrPublication::get_publications(query, start, rows)
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
  
  def test
    id = params[:id]
    
    @publication = Publication.find(id)
    @addresses = Address.find_by(publication_id: id)
    puts @addresses.inspect
  end

end
