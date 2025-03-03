resource "azurerm_resource_group" "resource_group" {
  name     = "${var.name}-rg"
  location = "${var.location}"
}