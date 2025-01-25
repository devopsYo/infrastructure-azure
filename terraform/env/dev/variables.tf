variable "config" {
    type      = object({
        env                               = string
        plaque_list      = list(object({
            rg_config                    = object({
                prefix                                        = string
                name                                          = string
                location                                      = string
            })
            vnet_config                 = object({
                name                                          = string
                address_space                                 = list(string)
            })    
            private_dns_zone_config = object({
                name = string
            })
            private_dns_zone_virtual_network_link_config = object({
                name       = string
            })
            subnet_hub_config             = object({
                name                                          = string
                address_prefixes                              = list(string)
                service_endpoints                             = list(string)
                delegation_enable                             = bool
                delegation                                    = optional(object({
                    name                                                  = string
                    service_delegation_name                               = string
                    service_delegation_actions                            = list(string)
                }))
            })
           
            subnet_bastion_config             = object({
                name                                          = string
                address_prefixes                              = list(string)
                service_endpoints                             = list(string)
                delegation_enable                             = bool
                delegation                                    = optional(object({
                    name                                                  = string
                    service_delegation_name                               = string
                    service_delegation_actions                            = list(string)
                }))
            })
            aks_config = object({
                cluster_name       = string
                dns_prefix         = string
                node_name          = string
                node_count         = number
                node_vm_size       = string
                kubernetes_version = string
                identity_type      = string
                network_plugin     = string
                load_balancer_sku  = string
                service_cidr       = string
                dns_service_ip     = string
                tags               = map(string)
            })
            vm_mgmt_config              = object({
                name                                          = string
                size                                          = string
                ip_name                                       = string
                private_ip_address_allocation                 = string
                nic_name                                      = string
                user_name                                     = string
                password                                      = string
                disable_password_authentication               = bool
                zone                                          = string
                os_disk_name                                  = string
                os_disk_caching                               = string
                os_disk_storage_account_type                  = string
                source_image_publisher                        = string
                source_image_offer                            = string
                source_image_sku                              = string
                source_image_version                          = string
                custom_data                                   = string
                managed_disk_attachment_config                = object({
                    name                                                  = string
                    storage_account_type                                  = string
                    create_option                                         = string
                    disk_size_gb                                          = number
                    lun                                                   = string
                    caching                                               = string
                    network_access_policy                                 = string
                })
            })
            vm_redis_config               = object({
                name                                          = string
                size                                          = string
                ip_name                                       = string
                private_ip_address_allocation                 = string
                nic_name                                      = string
                user_name                                     = string
                password                                      = string
                disable_password_authentication               = bool
                zone                                          = string
                os_disk_name                                  = string
                os_disk_caching                               = string
                os_disk_storage_account_type                  = string
                source_image_publisher                        = string
                source_image_offer                            = string
                source_image_sku                              = string
                source_image_version                          = string
                custom_data                                   = string
                managed_disk_attachment_config                = object({
                    name                                                  = string
                    storage_account_type                                  = string
                    create_option                                         = string
                    disk_size_gb                                          = number
                    lun                                                   = string
                    caching                                               = string
                    network_access_policy                                 = string
                })
            })  
            bastion_config              = object({
                name                                          = string
                sku                                           = string
                tunneling_enabled                             = bool
                ip_configuration_name                         = string
                public_ip_name                                = string
                public_ip_sku                                 = string
                public_ip_allocation_method                   = string
                
            })
            storage_account_list_config = list(object({
                name                                          = string
                private_dns_zone_suffix                       = string
                private_dns_zone_virtual_network_link_name    = string
                account_tier                                  = string
                account_replication_type                      = string
                network_rules_default_action                  = string  
                public_network_access_enabled                 = bool                            
            })) 
            asp_config                  = object({           
                name                                          = string
                os_type                                       = string
                sku_name                                      = string 
                worker_count                                  = number            
            })    
            app_insights_config                               = object({
                name                                                    = string 
                application_type                                        = string
            })          
            web_app_list_config                  = list(object({
                name                                          = string
                https_only                                    = bool
                always_on                                     = bool
                minimum_tls_version                           = string
                container_registry_use_managed_identity       = bool
                docker_image                                  = string
                docker_image_tag                              = string
                identity_type                                 = string
                node_version                                  = string
                app_settings                                  = map(string)                     
            }))  
            web_pub_sub_config            = object({
                name                                      = string
                sku                                       = string
                capacity                                  = number
                public_network_access_enabled             = bool
                live_trace                                = object({
                    enabled                                            = bool
                    messaging_logs_enabled                             = bool
                    connectivity_logs_enabled                          = bool
                })
            }) 
            kv_config                           = object({
                name                                          = string
                private_dns_zone_suffix                       = string
                private_dns_zone_virtual_network_link_name    = string
                enabled_for_disk_encryption                   = bool
                soft_delete_retention_days                    = number
                purge_protection_enabled                      = bool
                sku_name                                      = string
                key_permissions                               = list(string)
                secret_permissions                            = list(string)
                storage_permissions                           = list(string)
                private_endpoint_enable                       = number
                private_endpoint_config              = optional(object({
                    name                                            = string
                    private_service_connection_subresource_names    = list(string)
                    private_service_connection_is_manual_connection = bool
                    private_dns_zone_group_name                     = optional(string)
               }))    
            })
            container_registry_config       = object({
                name          = string
                sku           = string  
                admin_enabled = bool     
            })
            user_assigned_identity_config   = object({
                mysql                                = object({
                    name                                          = string
                })
                fcn_app                              = object({
                    name                                          = string
                })
            })       
        }))         
    })
}

