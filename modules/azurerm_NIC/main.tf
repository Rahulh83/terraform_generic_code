resource "azurerm_network_interface" "nic" {
  for_each            = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

dynamic  "ip_configuration" {
  for_each = each.value.ip_configuration_name
  content {
    name                          = ip_configuration.value.name
    public_ip_address_id          = data.azurerm_public_ip.pip1[each.key].id 
    subnet_id                     = data.azurerm_subnet.subnet1[each.key].id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation

  }
}
}