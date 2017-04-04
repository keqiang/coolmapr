getRequest <- function (url) {
  response <- httr::GET(url)
  httr::content(response)
}
