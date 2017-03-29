coolmap_url <- "http://localhost:10725/coolmap"
lockBinding("coolmap_url", environment())

coolmap_matrix_url <- paste(coolmap_url, "/matrices", sep = "")
lockBinding("coolmap_matrix_url", environment())
