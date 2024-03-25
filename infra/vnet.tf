resource "azurerm_virtual_network" "vnet" {
  name                = "vnet1"
  resource_group_name = "rgplatform101125"
  location            = "swedencentral"
  address_space       = ["10.0.0.0/16"]
}
