resource "azurerm_mssql_server" "SQL" {
  for_each                     = var.sql_servers
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator
    content {
      login_username = azuread_administrator.value.login_username
      object_id      = azuread_administrator.value.object_id
    }
  }
}

variable "sql_servers" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    azuread_administrator = map(object({
      login_username = string
      object_id      = string
    }))
  }))
}
