resource "grafana_dashboard" "host_metrics" {
  config_json = file("host-overview-dashboard.json")

  depends_on = [grafana_data_source.influxdb]
}

resource "grafana_data_source" "influxdb" {
  is_default    = var.grafana_data_source_is_default
  type          = var.grafana_data_source_type
  name          = var.grafana_data_source_name
  url           = var.grafana_data_source_url
  database_name = var.grafana_data_source_database_name
}
