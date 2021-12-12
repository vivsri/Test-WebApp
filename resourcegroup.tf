resource "azurerm_resource_group" "rg" {
  name     = "RTL-azure-webapp-rg"
  location = var.location
  tags = {
    "owner"       = "RTL"
    "cost_center" = "IT"
  }
}