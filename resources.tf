resource "azurerm_availability_set" "main_avail" {
  count               = var.count   
  name                = local.avail_name
  location            = var.location
  resource_group_name = var.rg_name

  platform_update_domain_count = var.platform_update_domain_count
  platform_fault_domain_count  = var.platform_fault_domain_count
  proximity_placement_group_id = var.proximity_placement_group_id
  managed                      = var.managed

  tags = merge(local.default_tags, var.extra_tags)
}
