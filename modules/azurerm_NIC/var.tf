# variable "nic" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     ip_configuration = object({
#       ip_configuration_name         = string
#       subnet_id                     = string
#       private_ip_address_allocation = string
#       public_ip_address_id          = string
#     })
#   }))
# }

variable "nics" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    virtual_network_name           = string
    subnet_name                  = string
    public_ip_name                = string
    ip_configuration_name         = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}