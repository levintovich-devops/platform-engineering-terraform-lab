resource "kubernetes_namespace_v1" "this" {
  metadata {
    name = var.namespace_name
  }
}

resource "kubernetes_resource_quota_v1" "this" {
  metadata {
    name      = "namespace-quota"
    namespace = kubernetes_namespace_v1.this.metadata[0].name
  }

  spec {
    hard = var.resource_quota
  }
}