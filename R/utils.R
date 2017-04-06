getRequest <- function (url) {
  response <- httr::GET(url)
  jsonlite::fromJSON(httr::content(response, "text"))
}

postRequest <- function (url, body) {
  response <- httr::POST(url, body = body, encode = 'json');
  jsonlite::fromJSON(httr::content(response, "text"))
}
