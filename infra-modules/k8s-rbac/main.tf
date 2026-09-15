resource "kubernetes_service_account_v1" "this" {
  metadata {
    name      = var.service_account_name
    namespace = var.namespace_name
  }
}

resource "kubernetes_role_v1" "pod_reader" {
  metadata {
    name      = "pod-reader"
    namespace = var.namespace_name
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "pods/log"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding_v1" "pod_reader" {
  metadata {
    name      = "pod-reader"
    namespace = var.namespace_name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role_v1.pod_reader.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account_v1.this.metadata[0].name
    namespace = var.namespace_name
  }
}