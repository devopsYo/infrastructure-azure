resource "helm_release" "helm" {
  name             = var.helm_config.name
  repository       = var.helm_config.repository
  chart            = var.helm_config.chart
  version          = var.helm_config.version
  namespace        = var.helm_config.namespace
  create_namespace = var.helm_config.create_namespace

  dynamic "set" {
    for_each = var.helm_config.set_values
    content {
      name  = set.key
      value = set.value
    }
  }
}