variable "azurem_security_group_name" {
  description = "nsg_name"
  type        = list(string)
}

variable "azurerm_resource_group_nsg_location" {
  type        = list(string)
  description = "nsg location"
}

variable "azurerm_resource_group_nsg_name" {
  type        = string
  description = "Resource group name"
 }


variable "azurem_custom_nsg_rules" {
  type = list(object({
    name                       = list(string)
    priority                   = list(number)
    direction                  = list(string)
    access                     = list(string)
    protocol                   = list(string)
    source_port_range          = list(string)
    destination_port_range     = list(string)
    source_address_prefix      = list(string)
    destination_address_prefix = list(string)
  }))
  description = "security_rule"
}

