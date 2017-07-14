# kube_related
relating to a kube deployment
 
### KOPS
Best to follow the guide here

### KUBEADM

Firstly, `vagrant up`


Secondly, run the commands in the initialise file (once ssh'd on to one of the vagrant instances) to initialise the cluster.
The `kubeadm init` step will produce a join command, which you'll need to run on each additional 
node you want to add to your cluster. 
