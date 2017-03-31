coolmap_url <- "http://localhost:10725/coolmap"
lockBinding("coolmap_url", environment())

coolmap_matrix_url <- paste(coolmap_url, "/matrices", sep = "")
lockBinding("coolmap_matrix_url", environment())

coolmap_ontology_url <- paste(coolmap_url, "/ontologies", sep = "")
lockBinding("coolmap_ontology_url", environment())
