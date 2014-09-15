# Ruby Identifier Catalog Search

This is a simple example of an application that consumes the [Mendeley](http://www.mendeley.com) API.  For more information about the API, see the [developer portal](http://dev.mendeley.com).

## About the application

A Ruby example script that populates a command-line user interface with identifier_types and then performs a search for a catalog document using the chosen identifier type. The sample code illustrates using the Mendeley API to:

*   Use Ruby and the oauth2 gem with the Mendeley API
*   Setup OAuth with client credentials flow
*   Use identifier_types to populate a user interface
*   Perform a Catalog fetch for a document


## How to run 

1. Install the [json](https://rubygems.org/gems/json) Ruby gem using the terminal command `gem install json`
* Install the [oauth2](https://github.com/intridea/oauth2) Ruby gem using the terminal command `gem install oauth2`
* Register your client at the Mendeley [developer portal](http://dev.mendeley.com/yourapps.html).  This will give you a client ID and secret.
* Edit the values for `CLIENT_ID` and `CLIENT_SECRET` *(lines 15-16)* in the Ruby script using the values obtained from the developer portal in the previous step
* Run the script using the terminal command `ruby /path/to/identifier_catalog_search.rb`
  * Select an identifier type and enter the index number
  * Enter a value for the identifier—samples are listed below

Output will appear as:

	gem install json
	gem install oauth2
	
	ruby /Users/benjamin/Desktop/Mendeley/api-documentation/code_samples/ruby/identifier-catalog-search/identifier_catalog_search.rb 

	Which identifier scheme would you like to use for your search [1-6]:
	  [1] arXiv ID
	  [2] DOI
	  [3] ISBN
	  [4] ISSN
	  [5] PubMed Unique Identifier (PMID)
	  [6] Scopus identifier (EID)
	
	3
	Please enter a value for the ISBN:
	9783527408283
	
	{"id"=>"fc0a94af-fd83-3530-ae5f-d43321ff72b3", "title"=>"Encyclopedia of Laser Physics and Technology", "type"=>"book", "authors"=>[{"first_name"=>"R.", "last_name"=>"Paschotta"}], "year"=>2009, "source"=>"Laser Physics", "identifiers"=>{"isbn"=>"9783527408283", "pmid"=>"15643187", "issn"=>"978-3-527-40828-3"}, "link"=>"http://www.mendeley.com/research/encyclopedia-laser-physics-technology", "abstract"=>"His comprehensive authored encyclopedia in two volumes explains the terms and principles of laser physics and technology,icncluding general optics and optoelectronics, nonlinear, quantum and fiber optics, as well as ultrashort pulses and optical communications."}
	
	
## Sample Identifiers

	arXiv ID                                0907.1926
	DOI                                     10.1103/PhysRevA.20.1521
	ISBN                                    9783527408283
	ISSN                                    1863-9119
	PubMed Unique Identifier (PMID)         18066238
	Scopus identifier (EID)                 2-s2.0-34547461095