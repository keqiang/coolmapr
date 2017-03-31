coolmap.ontologies.list <- function () {
  response <- httr::GET(coolmap_ontology_url)

  httr::content(response)
}

coolmap.ontology.get <- function (id) {
  url <- paste(coolmap_ontology_url, "/", id, sep = "")
  response <- httr::GET(url)

  httr::content(response)
}
