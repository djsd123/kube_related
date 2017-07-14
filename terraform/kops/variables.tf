variable "kops_user" {
  description = "The IAM user KOPs will use to bootstrap our K8s cluster in AWS"
  default = "kopsy"
}

variable "kops_bootstrap_role" {
  description = "Assuming this role gives the user the access required to bootstrap a KOPs cluster"
  default = "kops_role"
}