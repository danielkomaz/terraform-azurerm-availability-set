variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "custom_avail_name" {
  description = "Optional custom availability set name"
  type        = string
  default     = ""
}

variable "extra_tags" {
  description = "Extra tags to add"
  type        = map(string)
  default     = {}
}

variable "platform_update_domain_count" {
  description = "Number of update domains that are used. Defaults to 5 if not set."
  type        = number
  default     = null
}

variable "platform_fault_domain_count" {
  description = "Number of fault domains that are used. Defaults to 3 if not set."
  type        = number
  default     = null
}

variable "proximity_placement_group_id" {
  description = "ID of the Proximity Placement Group to which this Virtual Machine should be assigned. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "managed" {
  description = "Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is true."
  type        = bool
  default     = null
}
