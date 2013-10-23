# -*- encoding : utf-8 -*-
require 'net/http'

class SolrPublication < ActiveRecord::Base
  # OBS denna går mot solr på chalmers 
  def self.get_publications(query)
    uri = URI('http://gup.ub.gu.se/solr/publications/scigloo')
    params = { :q => "simple:#{query}", 
      #:fq => "person_id:" + personid, 
      :fl => 'pubid,title,pubyear,pubtypeid,pubtype_sv,pubtype_en', 
      :rows => 5,
      :wt => 'json' }
    uri.query = URI.encode_www_form(params)
    puts uri.query
    res = Net::HTTP.get_response(uri) 
    parsed = JSON.parse(res.body)
    return parsed['response']['docs']
  end
end
