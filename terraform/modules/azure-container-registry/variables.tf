variable "container_registry_config" {
    type = object({
        name          = string
        sku           = string    
        admin_enabled = bool   
    })
}

variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}