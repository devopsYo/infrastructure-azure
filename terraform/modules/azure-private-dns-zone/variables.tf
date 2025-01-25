variable "private_dns_zone_config" {
    type = object({
        name = string
    })
}


variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}