coolmap.matrix.list <- function () {
  response <- httr::GET(coolmap_matrix_url)
  httr::content(response)
}

coolmap.matrix.get <- function (id) {
  url <- paste(coolmap_matrix_url, "/", id, sep = "")
  response <- httr::GET(url)

  httr::content(response)
}

coolmap.matrix.load <- function (matrix, name = NULL)
{
  # get the dimension of the matrix
  row_number <- nrow(matrix)
  col_number <- ncol(matrix)

  col_names = colnames(matrix)
  # if matrix doesn't have column or row names, just use numeric labels
  if (length(col_names) == 0) {
    col_names = 1 : col_number
  }

  row_names = rownames(matrix)
  if (length(row_names) == 0) {
    row_names = 1 : row_number
  }

  # data will be a list of list, each list in data is data of a row in the matrix
  data <- list()
  for (i in 1 : row_number) {
    row_data <- numeric()
    for (j in 1 : col_number) {
      row_data <- c(row_data, matrix[i,j])
    }
    data[[i]] <- row_data
  }

  if (is.null(name)) {
    request_body <- list(row_labels = row_names, column_labels = col_names, data = data)
  } else {
    request_body <- list(row_labels = row_names, column_labels = col_names, data = data, name = name)
  }

  url <- paste(coolmap_url, "/matrices/load", sep="")
  result <- tryCatch( {
    response <- httr::POST(url, body = request_body, encode = "json")
    httr::content(response)
  }, warning = function(w) {
    return(list(result = 'warning', reason = w))
  }, error = function(e) {
    return(list(result = 'failed', reason = 'CoolMap not running'))
  })
  result
}
