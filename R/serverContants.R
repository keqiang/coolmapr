coolmap_url <- "http://localhost:10725/coolmap"
lockBinding("coolmap_url", environment())

coolmap_matrix_url <- paste(coolmap_url, "/matrices", sep = "")
lockBinding("coolmap_matrix_url", environment())

coolmap_ontology_url <- paste(coolmap_url, "/ontologies", sep = "")
lockBinding("coolmap_ontology_url", environment())

coolmap_property_table_url <- paste(coolmap_url, "/propertyTables", sep = "")
lockBinding("coolmap_property_table_url", environment())

coolmap_object_url <- paste(coolmap_url, "/objects", sep = "")
lockBinding("coolmap_object_url", environment())

url_param_data_scope = "dataScope";
lockBinding("url_param_data_scope", environment())

url_arg_data_scope_displayed <- "displayed";
lockBinding("url_arg_data_scope_displayed", environment())

url_arg_value_data_scope_leaf <- "leaf";
lockBinding("url_arg_data_scope_leaf", environment())
