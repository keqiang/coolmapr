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

coolmap.matrices.selections.set <- function(matrix_id, node_ids) {
  if (!is.null(node_ids)) {
    url <- paste(coolmap_matrix_url, "/", matrix_id, "/selections", sep = "")
    param_list <- list('node_ids' = node_ids)
    body <- jsonlite::toJSON(param_list)
    postRequest(url, body)
  }
}

coolmap.matrices.selections.intersections.set <- function(matrix_id, row_ids = NULL, col_ids = NULL) {
  url <- paste(coolmap_matrix_url, "/", matrix_id, "/selections", sep = "")
  param_list <- list()
  if (!is.null(row_ids)) {
    param_list$row_ids <- row_ids
  }

  if (!is.null(col_ids)) {
    param_list$column_ids <- col_ids
  }
  body <- jsonlite::toJSON(param_list)
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

coolmap.matrices.load <- function (matrix, row_ids = NULL, col_ids = NULL, name = NULL) {

  row_number <- nrow(matrix)
  col_number <- ncol(matrix)

  if (is.null(row_ids) || length(row_ids) != row_number) {
    row_ids = rownames(matrix)
    if (length(row_ids) == 0) {
      row_ids = 1 : nrow(matrix)
    }
  }

  if (is.null(col_ids) || length(col_ids) != col_number) {
    col_ids = colnames(matrix)
    # if matrix doesn't have column or row names, just use indices as labels
    if (length(col_ids) == 0) {
      col_ids = 1 : ncol(matrix)
    }
  }

  param_list <- list()
  if (!is.null(name)) {
    param_list$name <- name
  }

  param_list$row_ids = row_ids
  param_list$column_ids = col_ids
  param_list$data = matrix

  url <- paste(coolmap_url, "/matrices/load", sep="")
  postRequest(url, body = jsonlite::toJSON(param_list, auto_unbox = T))
}
