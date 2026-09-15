variable "namespace_name" {
  type        = string
  description = "Name of the Kubernetes namespace to create."
}

variable "kubeconfig_path" {
  type        = string
  description = "Path to the kubeconfig file used by the Kubernetes provider."
}

variable "resource_quota" {
  type        = map(string)
  description = "Resource quota limits applied to the namespace."
}

