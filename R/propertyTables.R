coolmap.propertyTables.list <- function () {
  response <- httr::GET(coolmap_property_table_url)

  httr::content(response)
}

coolmap.propertyTables.get <- function (id) {
  url <- paste(coolmap_property_table_url, "/", id, sep = "")
  response <- httr::GET(url)

  httr::content(response)
}
