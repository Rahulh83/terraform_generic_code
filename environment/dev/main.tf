module "RG1" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs

}

# module "storage" {
#   depends_on = [module.RG1]
#   source     = "../../modules/azurerm_storage_account"
#   stgs       = var.stgs

# }

module "vnet" {
  depends_on = [module.RG1]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets

}

module "PIP" {
  depends_on = [module.RG1]
  source     = "../../modules/azurerm_Public_IP"
  pip        = var.pipname

}

module "nic" {
  depends_on = [module.vnet, module.RG1]
  source     = "../../modules/azurerm_NIC"
  nics       = var.nics
}

module "vm" {
  depends_on = [module.nic, module.RG1]
  source     = "../../modules/azurerm_compute"
  vms        = var.vms
}