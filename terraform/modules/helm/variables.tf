variable "helm_config" {
  type = object({
    name             = string
    repository       = string
    chart            = string
    version          = string
    namespace        = string  
    create_namespace = bool
    set_values   = map(string)
  })
}