coolmap.ontologies.list <- function () {
  response <- httr::GET(coolmap_ontology_url)

  httr::content(response)
}

coolmap.ontologies.get <- function (id, format = "pairwise") {
  url <- paste(coolmap_ontology_url, "/", id, "?format=", format, sep = "")
  response <- httr::GET(url)

  httr::content(response)
}
