/*terraform {
  /*backend "azurerm" {
	
}*/

provider "azurerm" {
  features {}
}

module "Infrastructure" {
  source                  = "../../modules/azure-infrastructure"
  infra_config            = var.config.infra_config
}

locals {
  kube_config = module.Infrastructure.aks_cluster_kube_configs[0]
}

provider "kubernetes" {
  host                   = local.kube_config.host
  client_certificate     = base64decode(local.kube_config.client_certificate)
  client_key             = base64decode(local.kube_config.client_key)
  cluster_ca_certificate = base64decode(local.kube_config.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = local.kube_config.host
    client_certificate     = base64decode(local.kube_config.client_certificate)
    client_key             = base64decode(local.kube_config.client_key)
    cluster_ca_certificate = base64decode(local.kube_config.cluster_ca_certificate)
  }
}

module "argocd" {
  source       = "../../modules/helm"
  helm_config            = var.config.argocd_config
}
