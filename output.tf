output "azurerm_nsg_id" {
  value       = azurerm_network_security_group.nsg[*].id
}

output "azurerm_nsg_name" {
  value       = azurerm_network_security_group.nsg[*].name
}
