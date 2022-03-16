variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "security_group_name" {
  description = "Network security group name"
  type        = string
  default     = "nsg"
}

variable "tag_map" {
  description = "The tags to associate with your network security group."
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Location (Azure Region) for the network security group."
  type    = string
  default = "West Europe"
}

# Security Rules definition 

# Predefined rules   
variable "predefined_rules" {
  type    = any
  default = []
  description = "Pre defined rules for Network security group.All rules defined in rules.tf"
}
# Custom rules   
variable "custom_rules" {
  description = "Security rules for the network security group using this format name = [priority, direction, access, protocol, source_port_range, destination_port_range, src_address_prefix, destination_address_prefix, description]"
  type        = any
  default     = []
}

variable "src_address_prefix" {
  type    = list(string)
  default = ["*"]
  description = "source address prefix to be applied to all predefined rules.list(string) only allowed one element (CIDR, `*`, source IP range or Tags). Example [\"10.0.3.0/24\"] or [\"VirtualNetwork\"]"
  
}

variable "src_address_prefixes" {
  type    = list(string)
  default = null
  description = "source address prefixes to be applied to all predefined rules.Example [\"10.0.3.0/32\",\"10.0.3.128/32\"]"

}

variable "destination_address_prefix" {
  type    = list(string)
  default = ["*"]
  description = "destination address prefix to be applied to all predefined rules.list(string) only allowed one element (CIDR, `*`, source IP range or Tags). Example [\"10.0.3.0/24\"] or [\"VirtualNetwork\"]"
}

variable "destination_address_prefixes" {
  type    = list(string)
  default = null
  description = "destination address prefixes to be applied to all predefined rules.Example [\"10.0.3.0/32\",\"10.0.3.128/32\"]"

}