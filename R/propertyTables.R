coolmap.propertyTables.list <- function () {
  getRequest(coolmap_property_table_url)
}

coolmap.propertyTables.get <- function (id) {
  url <- paste(coolmap_property_table_url, "/", id, sep = "")
  getRequest(url)
}
