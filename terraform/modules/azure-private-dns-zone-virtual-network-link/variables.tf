variable "private_dns_zone_virtual_network_link_config" {
    type = object({
        name = string
    })
}

variable "private_dns_zone_virtual_network_link_config_dependency" {
    type = object({
        private_dns_zone_name = string
        virtual_network_id    = string
    })
}

variable "rg_config" {
    type = object({
        name                  = string
        location              = string
        prefix                = string 
    })
}