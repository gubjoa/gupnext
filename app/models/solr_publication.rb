# -*- encoding : utf-8 -*-
require 'net/http'

# Model to SOLR index, to perform search and get operations
class SolrPublication < ActiveRecord::Base
#  SOLR_BASE_URL = 'http://gup.ub.gu.se/'
#  SOLR_PUBLICATION_INDEX = 'solr/publications/scigloo'
  SOLR_BASE_URL = 'http://130.241.35.208:8080/'
  SOLR_PUBLICATION_INDEX = 'solr/scigloo/select'

  def self.get_publications(query, start, rows)
    uri = URI(SOLR_BASE_URL + SOLR_PUBLICATION_INDEX)
    params = { :q => "simple:#{query}", 
      :fl => 'pubid,title,pubyear,pubtypeid,pubtype_sv,pubtype_en,person,fulltext_url', 
      :start => start,
      :rows => rows,
      :wt => 'json' }
    uri.query = URI.encode_www_form(params)
    puts uri.query
    res = Net::HTTP.get_response(uri) 
    parsed = JSON.parse(res.body)
    parsed['response']['docs'].each do |doc|
    # Change the fulltext field representation
    fulltext_field = doc['fulltext_url']
      if fulltext_field
        new_json = handle_fulltext_links(fulltext_field)
        doc.merge!(:download_links => new_json)
        doc.delete('fulltext_url')
      end
    end
    # return the complete SOLR response
    return parsed
  end

  def self.get_publication(pubid)
    uri = URI(SOLR_BASE_URL + SOLR_PUBLICATION_INDEX)
    params = { :q => "pubid:#{pubid}", 
      :fl => 'pubid,title,pubyear,pubtypeid,pubtype_sv,pubtype_en,language_id,language_en,language_sv,person,fulltext_url,abstract', 
      :wt => 'json' }
    uri.query = URI.encode_www_form(params)
    puts uri.query
    res = Net::HTTP.get_response(uri) 
    parsed = JSON.parse(res.body)
    # remove the SOLR "frame"
    doc = parsed['response']['docs'][0]
    # Change the fulltext field representation
    fulltext_field = doc['fulltext_url']
    if fulltext_field
      new_json = handle_fulltext_links(fulltext_field)
      doc.merge!(:download_links => new_json)
      doc.delete('fulltext_url')
    end
    return doc
  end

  def self.handle_fulltext_links(field)
    # Create new field fragment
    new_field = []
    field.each do |f|
      if f.start_with?("1:")
        type = 1
        description = "Fulltext"
        oa = false
      elsif f.start_with?("2:")
        type = 2
        description = "Abstract"
        oa = false
      elsif f.start_with?("3:")
        type = 3
        description = "Fulltext Lokal OA"
        oa = true
      else # unknown type, do nothing?
        type = f[0]
        description = "Unknown"
        puts "Unknown fulltext type: " + ft
      end
      # Add the link data to the new field
      new_field << {:url => f[2..-1], :type => type, :description => description, :OA => oa}
    end
    return new_field
  end
end
