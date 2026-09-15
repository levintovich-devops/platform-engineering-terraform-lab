output "service_account_name" {
  description = "Name of the created Kubernetes service account."
  value       = kubernetes_service_account_v1.this.metadata[0].name
}
