# kube_related
relating to a kube deployment
 
### KOPS
Best to follow the official guide [here](https://github.com/kubernetes/kops/blob/master/docs/aws.md)

### KUBEADM

####Firstly, 
`vagrant up`


####Secondly 
`vagrant ssh xenial1` and run the commands in the __initialise.sh__ file __MANUALLY__, to initialise the cluster.
The `kubeadm init` step will produce a join command, which you'll need to run on each additional 
node you want to add to your cluster. 
