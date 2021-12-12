resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "RTL-azure-appserviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = var.asp-kind
  tags                = data.azurerm_resource_group.rg.tags

  sku {
    tier = var.asp-tier
    size = var.asp-size

  }
}