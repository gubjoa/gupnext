# -*- encoding : utf-8 -*-
require 'net/http'

# Model to SOLR index, to perform search and get operations
class SolrPublication < ActiveRecord::Base
  SOLR_BASE_ULR = 'http://gup.ub.gu.se/'
  SOLR_PUBLICATION_INDEX = 'solr/publications/scigloo'

  def self.get_publications(query, start, rows)
    uri = URI(SOLR_BASE_ULR + SOLR_PUBLICATION_INDEX)
    params = { :q => "simple:#{query}", 
      :fl => 'pubid,title,pubyear,pubtypeid,pubtype_sv,pubtype_en,person,fulltext_url', 
      :start => start,
      :rows => rows,
      :wt => 'json' }
    uri.query = URI.encode_www_form(params)
    puts uri.query
    res = Net::HTTP.get_response(uri) 
    parsed = JSON.parse(res.body)
    # return the complete SOLR response
    return parsed
  end

  def self.get_publication(pubid)
    uri = URI(SOLR_BASE_ULR + SOLR_PUBLICATION_INDEX)
    params = { :q => "pubid:#{pubid}", 
      :fl => 'pubid,title,pubyear,pubtypeid,pubtype_sv,pubtype_en,language_id,language_en,language_sv,person,fulltext_url,abstract', 
      :wt => 'json' }
    uri.query = URI.encode_www_form(params)
    puts uri.query
    res = Net::HTTP.get_response(uri) 
    parsed = JSON.parse(res.body)
    # remove the SOLR "frame"
    return parsed['response']['docs'][0]
  end

end
