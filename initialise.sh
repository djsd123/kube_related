
# RUN THESE COMMANDS MANUALLY
# At least until I figure out a way to nicely automate the cluster joining step

# Initialise the kubernetes cluster
kubeadm init

# Run Kubernetes as a non admin user
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/
export KUBECONFIG=$HOME/admin.conf

# Install overlay network from weave works. 
kubectl apply --filename https://git.io/weave-kube-1.6
