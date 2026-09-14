output "namespace_name" {
  description = "Name of the created Kubernetes namespace."
  value       = kubernetes_namespace_v1.this.metadata[0].name
}