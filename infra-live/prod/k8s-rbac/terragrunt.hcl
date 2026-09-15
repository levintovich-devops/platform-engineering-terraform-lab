include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${get_repo_root()}/infra-modules/k8s-rbac"
}

dependency "k8s_bootstrap" {
  config_path = "../k8s-bootstrap"
}

inputs = {
  namespace_name      = dependency.k8s_bootstrap.outputs.namespace_name
  service_account_name = "platform-reader"  
}