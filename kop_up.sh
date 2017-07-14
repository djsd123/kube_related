#!/usr/bin/env bash

kops create cluster \
    --node-count 3 \
    --zones=eu-west-1a,eu-west-1b,eu-west-1c \
    --master-zones eu-west-1a,eu-west-1b,eu-eu-west-1c \
    --dns-zone kube.mcallison.uk \
    --node-size t2.micro \
    --master-size t2.small \
    --topology private \
    --networking weave \
    --cloud-labels "Project=kubey" \
    --admin-access ${MY_CIDR} \
    --name ${NAME}