provider "azurerm" {
  features {} # Enable all features
}

# Define the existing Azure Resource Group
resource "azurerm_resource_group" "example" {
  name     = CST8918"        # Name of the existing resource group
  location = "Canada Central" # Location for the resource group
}

# Define the Azure Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "Kalpit-network"                        # Name of the virtual network
  address_space       = ["10.0.0.0/16"]                         # Address space for the virtual network
  location            = azurerm_resource_group.example.location # Location of the resource group
  resource_group_name = azurerm_resource_group.example.name     # Name of the resource group
}

# Define the subnet within the Virtual Network
resource "azurerm_subnet" "example" {
  name                 = "internal"                           # Name of the subnet
  resource_group_name  = azurerm_resource_group.example.name  # Name of the resource group
  virtual_network_name = azurerm_virtual_network.example.name # Name of the virtual network
  address_prefixes     = ["10.0.1.0/24"]                      # Address prefix for the subnet
}
