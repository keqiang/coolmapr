coolmap.matrices.list <- function () {
  getRequest(coolmap_matrix_url)
}

coolmap.matrices.get <- function (matrix_id, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.selections <- function (matrix_id, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/selections", "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.selections.set <- function(matrix_id, node_list) {
  if (!is.null(node_list)) {
    url <- paste(coolmap_matrix_url, "/", matrix_id, "/selections", sep = "")
    body <- jsonlite::toJSON(node_list);
    postRequest(url, body)
  }
}

coolmap.matrices.selections.intersections.set <- function(matrix_id, row_ids = c(), col_ids = c()) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/selections", sep = "")
  param_list <- list()
  if (!is.null(row_ids)) {
    param_list["row_ids"] <- row_ids
  }

  if (!is.null(col_ids)) {
    param_list["column_ids"] <- col_ids;
  }
  body <- jsonlite::toJSON(param_list);
  postRequest(url, body)
}

coolmap.matrices.row_ids <- function (matrix_id, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/rows", "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.col_ids <- function (matrix_id, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/columns", "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.row_ids.selections <- function (matrix_id, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/rows/selections", "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.col_ids.selections <- function (matrix_id, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/columns/selections", "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.row_vectors.get <- function (matrix_id, row_index, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/rowVectors/", row_index, "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.col_vectors.get <- function (matrix_id, col_index, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/columnVectors/", col_index, "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.row_vectors.selections <- function (matrix_id, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/rowVectors/selections", "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.col_vectors.selections <- function (matrix_id, data_scope = url_arg_data_scope_displayed) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/columnVectors/selections", "?", url_param_data_scope, "=", data_scope, sep = "")
  getRequest(url)
}

coolmap.matrices.cells.hover <- function (matrix_id, row_node, col_node) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/cells/hover", "?", url_param_row_node, "=", row_node, "&", url_param_col_node, "=", col_node, sep = "")
  getRequest(url)
}

coolmap.matrices.load <- function (matrix, name = NULL)
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
