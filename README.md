# PhylogeneticTree
# Language: R
# Input: TXT
# Output: TRE
# Tested with: PluMA 1.1, R 4.0.0
# Dependency:microbiome_1.12.0,ape_5.4.1,phyloseq_1.34.0

PluMA plugin that generates a phylogenetic tree.

The plugin takes as input a TXT file of tab-delimited keyword-value pairs:

OTU: OTU abundances
TAX: Taxonomy
META: Metadata
PHYLIP: Tree in phylip format

The new tree will be output in Newick format (.tre).
