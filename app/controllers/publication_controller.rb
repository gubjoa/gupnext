class PublicationController < ApplicationController
  
  # GET /publications/
  def index
    query = params[:q]
    params[:start] ? start = params[:start] : start = 0
    params[:rows] ? rows = params[:rows] : rows = 10

    if query
      render json: SolrPublication::get_publications(query, start, rows)
    end
  end

  # GET /publications/{id}
  def show
    publication_id = params[:id]
    publication = Publication.find_by_id(publication_id)
    if publication
      render :json => publication.to_json, :status => "200 OK"
    else
      render :nothing => true, :status => "404 Not Found"
    end
  end

  # POST /publications/
  def create
    publication = Publication.new(params[:publication])
    if publication.save
      headers['location'] = "/publications/#{publication.id}"
      status = "201 Created"
    else
      status = "501 Internal Server Error"
    end
    render :nothing => true, :status => status
  end

  # PUT /publications/{id}
  def update
    status = "501 Internal Server Error"
    publication_id = params[:id]
    publication = Publication.find_by_id(publication_id)

    if publication
      publication.update_attributes(params[:publication])
      # TODO Put in some more code to check attributes in JSON
      # We dont want to change each and every attribute like created_by
      if publication.save
        status = "200 OK"
      else
        status = "400 Bad Request"
      end
    else
      status = "404 Not Found"
    end
    render :nothing => true, :status => status
  end

  # DELETE /publications/{id}
  def destroy
    status = "501 Internal Server Error"
    publication_id = params[:id]
    publication = Publication.find_by_id(publication_id)
    
    if publication
      if publication.destroy
        status = "200 OK"
      end
    else
      status = "404 Not Found"
    end
    render :nothing => true, :status => status
  end
  
  def test
    id = params[:id]
    
    @publication = Publication.find(id)
    @addresses = Address.find_by(publication_id: id)
    puts @addresses.inspect
  end

end
