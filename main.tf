terraform {
  required_version = ">=0.12"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  address_space       = "${var.address_space}"
  location            = "${var.location}" 
  resource_group_name = "${var.rg}" 
}

resource "azurerm_subnet" "subnet" {
  depends_on = ["azurerm_virtual_network.vnet"]
  name                 = "${var.subnet_name}" 
  resource_group_name  = "${var.rg}" 
  virtual_network_name = "${var.vnet_name}"
  address_prefixes     = "${var.subnet_address_prefixes}" 
}
