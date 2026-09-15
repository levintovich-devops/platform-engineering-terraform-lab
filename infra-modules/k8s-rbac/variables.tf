variable "namespace_name" {
  type        = string
  description = "Namespace where RBAC resources will be created."
}

variable "kubeconfig_path" {
  type        = string
  description = "Path to the kubeconfig file used by the Kubernetes provider."
}

variable "service_account_name" {
  type        = string
  description = "Name of the Kubernetes service account."
}