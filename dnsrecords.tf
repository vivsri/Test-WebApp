resource "azurerm_dns_txt_record" "dnstxtrecord" {
  name                = "asuid"
  zone_name           = "abc.com"
  resource_group_name = "az-dns-test-zones"
  ttl                 = 300
  record {
    value = azurerm_app_service.webapp.custom_domain_verification_id
  }
}
resource "azurerm_dns_cname_record" "dnscnamerecord" {
  name                = "www"
  zone_name           = "abc.com"
  resource_group_name = "az-dns-test-zones"
  ttl                 = 300
  record              = azurerm_app_service.webapp.default_site_hostname
}
resource "azurerm_app_service_custom_hostname_binding" "customhostnamebinding" {
  hostname            = "www.abc.com"
  app_service_name    = azurerm_app_service.webapp.name
  resource_group_name = azurerm_resource_group.rg.name
  depends_on          = [azurerm_dns_txt_record.dnstxtrecord]

  # Ignore ssl_state and thumbprint as they are managed using Portal
  
  lifecycle {
    ignore_changes = [ssl_state, thumbprint]
  }
}