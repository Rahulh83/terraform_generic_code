# data "azurerm_public_ip" "pip" {
#     for_each = var.nics
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
# }

# data "azurerm_subnet" "nic" {
#     for_each = var.nics
#   name                 = each.value.name
#   virtual_network_name = each.value.virtual_network_name
#   resource_group_name  = each.value.resource_group_name
# }

data "azurerm_subnet" "subnet1" {
    for_each = var.nics
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip1" {
    for_each = var.nics
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
  
}