module "rg" {
    source = "../child_module/azurerm_resource_group"
   
    rgs = var.rgs
  
}

module "vnet" {
source = "../child_module/azurerm_virtual_network" 
vnet = var.vnet
 depends_on = [ module.rg ]
}

module "subnets" {
    source = "../child_module/azurerm_subnet"
    subnets = var.subnets
    depends_on = [ module.vnet ]
  
}

module "pip" {
    source = "../child_module/azurerm_public_ip"
    pip = var.pip
    depends_on = [ module.rg ]
  
}

module "vms" {
    source = "../child_module/azurerm_virtual_machine"
    vms = var.vms
    depends_on = [ module.rg,module.vnet,module.subnets ]
  
}