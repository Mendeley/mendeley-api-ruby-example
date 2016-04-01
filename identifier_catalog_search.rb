#!/usr/bin/ruby

# Sample code to illustrate using the Mendeley API to:
#   Use Ruby and oauth2 gem to connect and authorize
#   Setup OAuth with client credentials flow
#   Use identifier_types to populate UI
#   Perform a Catalog fetch for a document

require 'oauth2'
require 'json'
require 'optparse'

CLIENT_ID = ENV['MENDELEY_CLIENT_ID'] 
CLIENT_SECRET = ENV['MENDELEY_CLIENT_SECRET']


options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: identifier_catalog_search.rb [options]"

  opts.on("-tIDENTIFIER_TYPE", "--identifier_type=IDENTIFIER_TYPE", "Identifier type (e.g. DOI, ISBN)") do |identifier_type|
    options[:identifier_type] = identifier_type
  end

  opts.on("-iIDENTIFIER", "--identifier=IDENTIFIER", "Identifier value (e.g. 10.1103/PhysRevA.20.1521)") do |identifier|
    options[:identifier] = identifier
  end
end.parse!

DOCUMENT_TYPE_VERSION = 'application/vnd.mendeley-document-identifier.1+json'
DOCUMENT_VERSION = 'application/vnd.mendeley-document.1+json'


# OAuth 2.0 set up using client credenitals flow
client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => 'https://api.mendeley.com') 
token = client.client_credentials.get_token


# Fetch a list of Document Indentifier types and ask the user to select one
id_type_version =  # always use a version to ensure stability
response = token.get('/identifier_types', :headers => {'Accept' => DOCUMENT_TYPE_VERSION}) # API invocation to retrieve valid document identifier schemes


doc_id_types = JSON.parse(response.body) # array of objects, with two keys: name & description


id_type = doc_id_types.find(-> { raise ArgumentError, "The specified identifier type is not accepted by the API." }) { |type|
  type['name'] == options[:identifier_type]
}

id_type_name = id_type['name']
id_query = options[:identifier]

puts "Search the catalog for the identifier #{id_type_name} = #{id_query}..."

response = token.get('/catalog',
  :params => { id_type_name => id_query }, 
  :headers => {'Accept' => DOCUMENT_VERSION}) #e.g. GET /catalog?doi=value

document = JSON.parse(response.body)
puts document # handle errors for no results found




# Sample Identifiers
####################################################################
#   arXiv ID                                0907.1926
#   DOI                                     10.1103/PhysRevA.20.1521
#   ISBN                                    9783527408283
#   ISSN                                    1863-9119
#   PubMed Unique Identifier (PMID)         18066238
#   Scopus identifier (EID)                 2-s2.0-34547461095
