data "azurerm_app_service_plan" "appserviceplan" {
  name                = azurerm_app_service_plan.appserviceplan.name
  resource_group_name = azurerm_resource_group.rg.name
}
data "azurerm_subnet" "integrationsubnet" {
  name                 = azurerm_subnet.integrationsubnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "azurerm_app_service" "webapp" {
  name                = "RTL-azure-webapp-service"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  https_only          = true
  identity {
    type = "SystemAssigned"
  }
  site_config {
    always_on = true
    default_documents = [
      "Default.htm",
      "Default.html",
      "Default.asp",
      "index.htm",
      "index.html",
      "iisstart.htm",
      "default.aspx",
      "index.php",
    "hostingstart.html", ]
    php_version               = "5.6"
    use_32_bit_worker_process = true
    dotnet_framework_version  = "v4.0"
    ftps_state                = "FtpsOnly"
  }
lifecycle {
  ignore_changes = [site_config]
}
  app_settings = {
    "WEBSITE_DNS_SERVER" : "168.63.129.16",
    "WEBSITE_VNET_ROUTE_ALL" : "1"
  }
  tags = data.azurerm_resource_group.rg.tags

}
resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
  app_service_id = azurerm_app_service.webapp.id
  subnet_id      = azurerm_subnet.integrationsubnet.id
}

