resource "azurerm_linux_virtual_machine" "vm1" {
  for_each = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]

  # Ensure at least one os_disk block exists (use properties from the input object)
  dynamic "os_disk" {
    for_each = [each.value.os_disk]
    content {
        caching = os_disk.value.caching
        storage_account_type = os_disk.value.storage_account_type   
      
    }
  }

  # If source_image_reference is optional but provided as an object, create one block; if it's a list adjust accordingly.
  dynamic "source_image_reference" {
    for_each = [each.value.source_image_reference]
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }
}