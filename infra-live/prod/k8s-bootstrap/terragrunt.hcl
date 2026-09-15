include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/infra-modules/k8s-bootstrap"
}

inputs = {
  namespace_name  = "platform-prod"  

  resource_quota = {
    "requests.cpu"    = "2"
    "requests.memory" = "2Gi"
    "limits.cpu"      = "4"
    "limits.memory"   = "4Gi"
    "pods"            = "20"
  }
}