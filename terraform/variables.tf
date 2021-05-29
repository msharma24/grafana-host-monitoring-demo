variable "grafana_data_source_type" {
  description = "(Required) The data source type. Must be one of the data source keywords supported by the Grafana server."
  type        = string
}

variable "grafana_data_source_name" {
  description = "(Required) A unique name for the data source within the Grafana server."
  type        = string
}

variable "grafana_data_source_is_default" {
  description = "(Optional) If true, the data source will be the default source used by the Grafana server. Only one data source on a server can be the default."
  type        = bool
}

variable "grafana_data_source_url" {
  description = "The URL for the data source. The type of URL required varies depending on the chosen data source type"
  type        = string
}


variable "grafana_data_source_database_name" {
  description = "The name of the database to use on the selected data source server."
  type        = string
}
