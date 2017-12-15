
#export AWS_REGION=eu-west-2
export CLUSTER=t-cluster
export INSTALLER_PATH=/Users/mallison/workspace/mikael/kube_related/tectonic/tectonic-installer/darwin/installer
export TERRAFORM_CONFIG=/Users/mallison/workspace/mikael/kube_related/tectonic/.terraformrc
export KUBECONFIG=/Users/mallison/workspace/mikael/kube_related/tectonic/generated/auth/kubeconfig

# cd /Users/mallison/workspace/mikael/kube_related/tectonic
# terraform plan -var-file=build/t-cluster/terraform.tfvars platforms/aws
# terraform apply -var-file=build/t-cluster/terraform.tfvars platforms/aws
# terraform destroy -var-file=build/t-cluster/terraform.tfvars platforms/aws
