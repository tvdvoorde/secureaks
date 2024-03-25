resource "azurerm_virtual_network" "vnet" {
  name                = "vnet1"
  resource_group_name = var.resource_group_name
  location            = data.azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

variable resource_group_name {
}

data azurerm_resource_group rg {
  name = var.resource_group_name
}

