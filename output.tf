output "webapp_url" {
    value = azurerm_app_service.webapp.default_site_hostname
}
output "webapp_url_custom" {
    value = azurerm_app_service_custom_hostname_binding.customhostnamebinding.hostname
}