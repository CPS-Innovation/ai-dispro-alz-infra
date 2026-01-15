# -------------------------------------------------------------- #

variable "pipeline_name" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "branch_name" {
  type = string
}

variable "repo_uri" {
  type = string
}

variable "date" {
  type = string
}

variable "run_number" {
  type = string
}

# -------------------------------------------------------------- #

variable "location" {
  type    = string
  default = "uksouth"
}

variable "environment" {
  type = string
}

variable "subscription" {
  type = string
}

variable "sku" {
  type = string
}

variable "static_ip" {
  type = string
}

variable "subnets" {
  description = "List of subnet objects, each with name, address_prefixes, optional security_group, optional route_table_id, and optional delegation."
  type = list(object({
    name             = string
    address_prefixes = list(string)
    security_group   = optional(string)
    route_table_id   = optional(string)
    service_delegation = optional(object({
      name    = string
      actions = list(string)
    }))
  }))
}