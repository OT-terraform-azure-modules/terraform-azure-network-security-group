Azure Network Security Group Terraform module
=============================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates Network Security Group with predefind and custom rule.

These types of resources are supported:

* [NSG]()

Terraform versions
------------------
Terraform v1.0.1

Usage
------

```hcl

module "network-security-group" {
  source                = "../"
  resource_group_name   = azurerm_resource_group.nsg.name
  resource_group_location              = "EastUS" # Optional; if not provided, will use Resource Group location
  security_group_name   = "nsg"
  src_address_prefix = ["10.0.1.0/24"]
  predefined_rules = [
    {
      name     = "SSH"
      priority = "100"
      
    },
    {
      name              = "HTTP"
      priority          = "101"
    }
  ]

  custom_rules = [
    {
      name                   = "ubuntuSSH"
      priority               = 201
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "22"
      src_address_prefix  = "10.151.0.0/24"
      description            = "ssh to ubuntu machine"
    },
    {
      name                    = "myhttp"
      priority                = 200
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "8080"
      src_address_prefixes = ["10.151.0.0/24", "10.151.1.0/24"]
      description             = "description-http"
    },
  ]

  tag_map = {
    environment = "dev"
  }

  depends_on = [azurerm_resource_group.nsg]
}

```

Tags
----
* Tags are assigned to resources with name variable as prefix.
* Additial tags can be assigned by tags variables as defined above.


Resources
------
| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.predefined_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.custom_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Name of the Resource Group | `string` | `""` | Yes |
| resource_group_location | Location (Azure Region) for the network security group. | `string` | `""` | Yes |
| security_group_name    | Network security group name | `string` | `"nsg"` | No |
| src_address_prefix    | List of source address prefixes | `list(string)` | `[""]` | No |
| src_address_prefixes    | List of source address prefixes | `list(string)` | `[""]` | No |
| destination_address_prefix    | List of destination address prefixes | `list(string)` | `[""]` | No |
| destination_address_prefixes    | List of destination address prefixes | `list(string)` | `[""]` | No |
| predefined_rules  |  pre-defined rules for commonly used protocols (for example HTTP or ActiveDirectory) | `any` | `[]` | No |
| custom_rules  | Security rules for the network security group using this format name = [priority, direction, access, protocol, source_port_range, destination_port_range, src_address_prefix, destination_address_prefix, description] | `any` | `[]` | No |
| tag_map | The tags to associate with your network security group. | `map(string)` | `""` | No



Output
------
| Name | Description |
|------|-------------|
| nsg_id | Network Security Group ID |
| nsg_name | Network Security Group Name |

### Contributors

|  [![Ajay Panwar][ajay_avatar]][ajay_homepage]<br/>[Ajay Panwar][ajay_homepage] |
|---|

  [ajay_homepage]: https://gitlab.com/panwar.ajay
  [ajay_avatar]: https://gitlab.com/uploads/-/system/user/avatar/7759010/avatar.png?width=400
