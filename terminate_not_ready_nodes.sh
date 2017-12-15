#!/usr/bin/env bash

NOT_READY_NODES=$(kubectl describe node `kubectl get node | grep Not | awk '{ print $1}'` | grep ExternalID | awk '{ print $2 }')

for i in $NOT_READY_NODES; do

  aws ec2 terminate-instances --instance-ids $i --region eu-west-1

done
