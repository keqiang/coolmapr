coolmap.ontologies.list <- function () {
  getRequest(coolmap_ontology_url)
}

coolmap.ontologies.get <- function (id, format = "pairwise") {
  url <- paste(coolmap_ontology_url, "/", id, "?format=", format, sep = "")
  getRequest(url)
}
