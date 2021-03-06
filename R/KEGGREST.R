convertTable <- function(res){
  if(nchar(res) == 0){
    print("no result")
    result <- NULL
  } else {
    rows <- strsplit(res, "\n")
    rows.len <- length(rows[[1]])
    result <- matrix(unlist(lapply(rows, strsplit, "\t")), nrow=rows.len, byrow=T)
  }
  result
}

list.organisms <- function(){ 
  url <- "http://rest.kegg.jp/list/organism"
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table
}

list.pathways <- function(org){
  url <- paste("http://rest.kegg.jp/list/pathway", org, sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table
}

bconv <- function(id.list){
  url <- paste("http://rest.genome.jp/link", paste(append(id.list, "-e"), collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table[,c(1,2)]
}

bget <- function(dbentries, option=""){
  url <- paste("http://rest.kegg.jp/get", paste(dbentries, collapse="+"), option, sep="/")
  print(url)
  response <- getURL(url)
  response
}

get.genes.by.pathway <- function(pathway.id){
  url <- paste("http://rest.kegg.jp/link", substr(pathway.id, 6, 8), pathway.id, sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table
}

get.ko.by.gene <- function(genes.id){
  url <- paste("http://rest.kegg.jp/link/ko", paste(genes.id, collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table
}

get.ko.by.ko.class <- function(ko.class.id){
  url <- paste("http://rest.kegg.jp/link/ko", paste(ko.class.id, collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)  
  table  
}

get.genes.by.ko <- function(ko.id.list, org){
  url <- paste("http://rest.kegg.jp/link", org, paste(ko.id.list, collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table
}

get.pathways.by.genes <- function(genes.id.list){
  url <- paste("http://rest.kegg.jp/link/pathway", paste(genes.id.list, collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)  
  table  
}

get.pathways.by.enzymes <- function(enzyme.id.list){
  url <- paste("http://rest.kegg.jp/link/pathway", paste(enzyme.id.list, collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)  
  table  
}

get.pathways.by.compounds <- function(compound.id.list){
  url <- paste("http://rest.kegg.jp/link/pathway", paste(compound.id.list, collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)  
  table
}

get.pathways.by.reactions <- function(reaction.id.list) {
  url <- paste("http://rest.kegg.jp/link/pathway", paste(reaction.id.list, collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table 
}

search.compounds.by.mol_weight <- function(lower.limit, upper.limit){
  url <- paste("http://rest.kegg.jp/find/compound", paste(lower.limit, upper.limit, sep="-"), "mol_weight", sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)  
  table
}

search.compounds.by.exact_mass <- function(exact.mass){
  url <- paste("http://rest.kegg.jp/find/compound", exact.mass, "exact_mass", sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table
}

search.compounds.by.name <- function(name) {
  url <- paste("http://rest.kegg.jp/find/compound", paste(strsplit(name, " ")[[1]], collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table
}

search.glycans.by.name <- function(name) {
  url <- paste("http://rest.kegg.jp/find/glycan", paste(strsplit(name, " ")[[1]], collapse="+"), sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table
} 

search.compounds.by.composition <- function(composition) {
  url <- paste("http://rest.kegg.jp/find/compound", composition, "formula", sep="/")
  print(url)
  response <- getURL(url)
  table <- convertTable(response)
  table 
}         