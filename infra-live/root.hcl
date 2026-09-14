locals {
  state_root = "${get_repo_root()}/.local-state"
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
terraform {
  backend "local" {
    path = "${local.state_root}/${path_relative_to_include()}/terraform.tfstate"
  }
}
EOF
}

generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "kubernetes" {
  config_path = pathexpand(var.kubeconfig_path)
}
EOF
}
