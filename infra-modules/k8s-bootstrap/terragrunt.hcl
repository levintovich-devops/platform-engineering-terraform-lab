include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/infra-modules/k8s-bootstrap"
}

inputs = {
  namespace_name  = "platform-dev"
  kubeconfig_path = "~/.kube/config"
}

resource_quota = {
  "requests.cpu"    = "1"
  "requests.memory" = "1Gi"
  "limits.cpu"      = "2"
  "limits.memory"   = "2Gi"
  "pods"            = "10"
}