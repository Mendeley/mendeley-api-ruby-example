##!/usr/bin/ruby

# Sample code to illustrate using the Mendeley API to:
#   Use Ruby and oauth2 gem to connect and authorize
#   Setup OAuth with client credentials flow
#   Use identifier_types to populate UI
#   Perform a Catalog fetch for a document
#
# gem install json
# gem install oauth2

require 'oauth2'
require 'json'

CLIENT_ID = '799'
CLIENT_SECRET = 'gHgy8e5IuMPBrbzl' # client_secret is sample value. PLEASE REPLACE BEFORE USE
DOCUMENT_TYPE_VERSION = 'application/vnd.mendeley-document-identifier.1+json'
DOCUMENT_VERSION = 'application/vnd.mendeley-document.1+json'


# OAuth 2.0 set up using client credenitals flow
client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => 'https://api.mendeley.com') 
token = client.client_credentials.get_token


# Fetch a list of Document Indentifier types and ask the user to select one
id_type_version =  # always use a version to ensure stability
response = token.get('/identifier_types', :headers => {'Accept' => DOCUMENT_TYPE_VERSION}) # API invocation to retrieve valid document identifier schemes


doc_id_types = JSON.parse(response.body) # array of objects, with two keys: name & description
puts "\nWhich identifier scheme would you like to use for your search [1-#{doc_id_types.length}]:"
doc_id_types.each_with_index { |doc_id, i| puts "  [#{i+1}] #{doc_id['description']}"}
id_type_index = (gets.chomp.to_i)-1 # ideally check for invalid values here



# Ask the user to enter a value for the identifier and perform a Catalog fetch
puts "Please enter a value for the #{doc_id_types[id_type_index]['description']}:"
id_query = gets.chomp
response = token.get('/catalog',
  :params => { doc_id_types[id_type_index]['name'] => id_query }, 
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