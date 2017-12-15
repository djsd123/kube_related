#!/usr/bin/env bash

set -e

NODE_COUNT=2
NODE_SIZE=${NODE_SIZE:-t2.micro}
MASTER_SIZE=${MASTER_SIZE:-t2.micro}
ZONES=${ZONES:-"eu-west-2b"}

kops create cluster --name=k8s.kube.mcallison.uk \
    --dns-zone=kube.mcallison.uk \
    --zones=$ZONES \
    --master-size=$MASTER_SIZE \
    --node-size=$NODE_SIZE \
    --node-count=$NODE_COUNT \
    --admin-access=82.19.225.157/32 \
    --target=terraform

#Kops has set your kubectl context to k8s.kube.mcallison.uk
#
#Terraform output has been placed into out/terraform
#Run these commands to apply the configuration:
#   cd out/terraform
#   terraform plan
#   terraform apply
#
#Suggestions:
# * validate cluster: kops validate cluster
# * list nodes: kubectl get nodes --show-labels
# * ssh to the master: ssh -i ~/.ssh/id_rsa admin@api.k8s.kube.mcallison.uk
#The admin user is specific to Debian. If not using Debian please use the appropriate user based on your OS.
# * read about installing addons: https://github.com/kubernetes/kops/blob/master/docs/addons.md
