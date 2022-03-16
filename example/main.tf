# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

terraform {
  required_providers {

    azurerm = {
      source = "hashicorp/azurerm"

    }

  }
}

resource "azurerm_resource_group" "nsg" {
  name     = "MyNsgRG"
  location = "EastUS"
}

module "network-security-group" {
  source              = "../"
  resource_group_name = azurerm_resource_group.nsg.name
  location            = azurerm_resource_group.nsg.location # Optional; if not provided, will use Resource Group location
  security_group_name = "nsg"
  src_address_prefix  = ["10.0.1.0/24"]
  predefined_rules = [
    {
      name     = "SSH"
      priority = "100"

    },
    {
      name     = "HTTP"
      priority = "101"
    }
  ]

  custom_rules = [
    {
      name                   = "mySSH"
      priority               = 201
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "22"
      src_address_prefix     = "VirtualNetwork"
      description            = "ssh to ubuntu machine"
    },
    {
      name                   = "myHTTP"
      priority               = 200
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "8080"
      src_address_prefixes   = ["10.0.1.0/24"]
      description            = "description-http"
    },
  ]

  tag_map = {
    environment = "dev"
  }

  depends_on = [azurerm_resource_group.nsg]
}