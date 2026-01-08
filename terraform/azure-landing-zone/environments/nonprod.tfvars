subscription        = "nonprod"

vnet_address_space = ["10.7.171.0/24"]
subnets = [
  {
    name             = "snet-nonprod-01"
    address_prefixes = ["10.7.171.0/28"]
  },
  {
    name             = "snet-psql-dev-01"
    address_prefixes = ["10.7.171.16/28"]
  },
  {
    name             = "snet-psql-stg-01"
    address_prefixes = ["10.7.171.32/28"]
  },
  {
    name             = "snet-asp-shrd-vnetint-nonprod-01"
    address_prefixes = ["10.7.171.48/28"]
    service_delegation = {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  },
  {
    name             = "snet-asp-shrd-pe-dev-01"
    address_prefixes = ["10.7.171.64/28"]
  },
  {
    name             = "snet-asp-shrd-pe-stg-01"
    address_prefixes = ["10.7.171.80/28"]
  }
]