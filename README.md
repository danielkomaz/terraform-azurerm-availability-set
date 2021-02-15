# Azure Availability Set

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/danielkomaz/availability-set/azurerm/)

Common Azure terraform module to create a Availability Set

## Usage

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

resource "azurerm_resource_group" "rg" {
	name     = var.rg_name
	location = var.rg_location

    tags = {
        environment = "dev"
        stack       = "web"
    }
}

module "availability_set" {
  source      = "danielkomaz/availability-set/azurerm"
  version     = "0.1.0"
  rg_name     = azurerm_resource_group.rg_name
  location    = azurerm_resource_group.rg_location
  environment = "dev"
  client_name = "contoso"
  managed     = false
  stack       = "web"
}
```

## Inputs

| Name                         | Description                                                                                        | Type          | Default | Required |
| ---------------------------- | -------------------------------------------------------------------------------------------------- | ------------- | ------- | :------: |
| client_name                  | Client name/account used in naming                                                                 | `string`      | n/a     |   yes    |
| custom_avail_name            | Optional custom availbity set name. Default name: <name_prefix><stack>-<client_name>-<environment> | `string`      | `""`    |    no    |
| environment                  | Project environment                                                                                | `string`      | n/a     |   yes    |
| extra_tags                   | Extra tags to add                                                                                  | `map(string)` | `{}`    |    no    |
| location                     | Azure region to use                                                                                | `string`      | n/a     |   yes    |
| managed                      | Specifies whether the availability set is managed or not                                           | `bool`        | n/a     |    no    |
| name_prefix                  | Optional prefix for the generated name                                                             | `string`      | n/a     |    no    |
| platform_update_domain_count | Number of update domains that are used. Defaults to 5 if not set                                   | `number`      | n/a     |    no    |
| platform_fault_domain_count  | Number of fault domains that are used. Defaults to 3 if not set                                    | `number`      | n/a     |    no    |
| proximity_placement_group_id | ID of the Proximity Placement Group to which this Virtual Machine should be assigned               | `string`      | `""`    |    no    |
| rg_name                      | Name of Resource Group to put the Availability Set in                                              | `string`      | n/a     |   yes    |
| stack                        | Project stack name                                                                                 | `string`      | n/a     |   yes    |

## Outputs

| Name                | Description                   |
| ------------------- | ----------------------------- |
| availability_set_id | Availability set generated id |

## Related documentation

Terraform Azure RG documentation: [terraform.io/docs/providers/azurerm/r/availability_set.html](https://www.terraform.io/docs/providers/azurerm/r/availability_set.html)
