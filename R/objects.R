coolmap.objects.list <- function () {
  response <- httr::GET(coolmap_object_url)

  httr::content(response)
}
