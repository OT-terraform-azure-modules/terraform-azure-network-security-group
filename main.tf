resource "azurerm_network_security_group" "nsg" {
  count               = length(var.azurem_security_group_name)
  name                = var.azurem_security_group_name[count.index]
  location            = var.azurerm_resource_group_nsg_location[count.index]
  resource_group_name = var.azurerm_resource_group_nsg_name
  dynamic "security_rule" {
    for_each = var.azurem_custom_nsg_rules
    content {
      name                       = security_rule.value.name[count.index]
      priority                   = security_rule.value.priority[count.index]
      direction                  = security_rule.value.direction[count.index]
      access                     = security_rule.value.access[count.index]
      protocol                   = security_rule.value.protocol[count.index]
      source_port_range          = security_rule.value.source_port_range[count.index]
      destination_port_range     = security_rule.value.destination_port_range[count.index]
      source_address_prefix      = security_rule.value.source_address_prefix[count.index]
      destination_address_prefix = security_rule.value.destination_address_prefix[count.index]
    }
  }
}
