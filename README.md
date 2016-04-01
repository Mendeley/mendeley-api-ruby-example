# Ruby Identifier Catalog Search

This is a simple example of an application that consumes the [Mendeley](http://www.mendeley.com) API.  For more information about the API, see the [developer portal](http://dev.mendeley.com).

## About the application

A Ruby example script that uses the Mendeley API to:

*   Use Ruby and the oauth2 gem with the Mendeley API
*   Setup OAuth with client credentials flow
*   Determine if the identifier type you provided is supported by the API
*   Perform a Catalog search for documents matching the supplied identifier


## Prerequisites

Register your client at the Mendeley [developer portal](http://dev.mendeley.com/yourapps.html).  This will give you a client ID and secret.

## How to run 

1. Install the 3rd party Ruby gem dependencies using the terminal command `bundle install --path vendor/bundle`
2. Set the `MENDELEY_CLIENT_ID` and `MENDELEY_CLIENT_SECRET` environment variables in your shell to the values obtained from the developer portal in the previous step
3. Think of a document you want to look up, then find its corresponding identifier type (e.g. "doi") and identifier (e.g. 10.1103/PhysRevA.20.1521).
4. Run the script using the terminal command, passing in the identifier as command line arguments. For example, `bundle exec ruby identifier_catalog_search.rb --identifier_type doi --identifier 10.1103/PhysRevA.20.1521`

Output will look a bit like this:

	{"title"=>"Laser cooling of atoms", "type"=>"journal", "authors"=>[{"first_name"=>"D. J.", "last_name"=>"Wineland"}, {"first_name"=>"Wayne M.", "last_name"=>"Itano"}], "year"=>1979, "source"=>"Physical Review A", "identifiers"=>{"isbn"=>"9788578110796", "pmid"=>"25246403", "scopus"=>"2-s2.0-33749570604", "doi"=>"10.1103/PhysRevA.20.1521", "arxiv"=>"arXiv:1011.1669v3", "issn"=>"10502947"}, "id"=>"04d48d5f-d664-3a17-b004-1503cca53802", "abstract"=>"Predicting the binding mode of flexible polypeptides to proteins is an important task that falls outside the domain of applicability of most small molecule and protein\u2212protein docking tools. Here, we test the small molecule flexible ligand docking program Glide on a set of 19 non-\u03B1-helical peptides and systematically improve pose prediction accuracy by enhancing Glide sampling for flexible polypeptides. In addition, scoring of the poses was improved by post-processing with physics-based implicit solvent MM- GBSA calculations. Using the best RMSD among the top 10 scoring poses as a metric, the success rate (RMSD \u2264 2.0 \u00C5 for the interface backbone atoms) increased from 21% with default Glide SP settings to 58% with the enhanced peptide sampling and scoring protocol in the case of redocking to the native protein structure. This approaches the accuracy of the recently developed Rosetta FlexPepDock method (63% success for these 19 peptides) while being over 100 times faster. Cross-docking was performed for a subset of cases where an unbound receptor structure was available, and in that case, 40% of peptides were docked successfully. We analyze the results and find that the optimized polypeptide protocol is most accurate for extended peptides of limited size and number of formal charges, defining a domain of applicability for this approach.", "link"=>"http://www.mendeley.com/research/laser-cooling-atoms"}

	
## Sample Identifiers

	arXiv ID                                0907.1926
	DOI                                     10.1103/PhysRevA.20.1521
	ISBN                                    9783527408283
	ISSN                                    1863-9119
	PubMed Unique Identifier (PMID)         18066238
	Scopus identifier (EID)                 2-s2.0-34547461095
