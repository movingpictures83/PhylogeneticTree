
dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

library(microbiome)
library(phyloseq)
library(ape)

input <- function(inputfile) {
  pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1]; 
   # Need to get the three files
   otu.path <<- paste(pfix, parameters["OTU", 2], sep="/")
   tax.path <<- paste(pfix, parameters["TAX", 2], sep="/")
   map.path <<- paste(pfix, parameters["META", 2], sep="/")
   tree.path <<- paste(pfix, parameters["PHYLIP", 2], sep="/")
   #measure <<- "Simpson"
   #HMP <<- import_qiime(otu.path, map.path, tree.path, parseFunction = parse_taxonomy_qiime)
}

run <- function() {
   x <<- read_phyloseq(otu.file = otu.path,
                  taxonomy.file = tax.path,
                  metadata.file = map.path,
                  sep = ",")
y <<- read.tree(tree.path)
z <<- merge_phyloseq(x, y)
}

output <- function(outputfile) {
tree2 = phy_tree(z)
ape::write.tree(tree2, outputfile)
}
