output "aks_cluster_kube_configs" {
  value = [
    for aks in module.AKS : {
      host                   = aks.kube_config.host
      client_certificate     = aks.kube_config.client_certificate
      client_key             = aks.kube_config.client_key
      cluster_ca_certificate = aks.kube_config.cluster_ca_certificate
    }
  ]
}
