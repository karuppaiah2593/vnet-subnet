resource "azurerm_resource_group" "example" {
  name     = "test-rg"
  location = "East US"
  tags = {
    CreatedBy  = "Devops"
    UsedBy     = "Testing"
    UsedFor    = "Testing"
    Owner      = "IT"
  }
}

resource "azurerm_network_security_group" "example" {
  name                = "test-security-group"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    CreatedBy  = "Devops"
    UsedBy     = "Testing"
    UsedFor    = "Testing"
    Owner      = "IT"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "test-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.example.id
  }

  tags = {
    CreatedBy  = "Devops"
    UsedBy     = "Testing"
    UsedFor    = "Testing"
    Owner      = "IT"
  }
}
