output "grafana_data_source_id" {
  value = grafana_data_source.influxdb.id
}

output "grafana_data_source_id_url" {
  value = grafana_dashboard.host_metrics.slug
}

output "grafana_dashboard_id" {
  value = grafana_dashboard.host_metrics.dashboard_id
}
