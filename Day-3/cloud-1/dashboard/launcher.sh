#!/usr/bin/env bash
#uinstall the  dashboard
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

#start the dashboard
kubectl proxy

# Create the service account in the current namespace
# (we assume default)
kubectl create serviceaccount my-dashboard-sa
# Give that service account root on the cluster
kubectl create clusterrolebinding my-dashboard-sa \
  --clusterrole=cluster-admin \
  --serviceaccount=default:my-dashboard-sa
# Find the secret that was created to hold the token for the SA
kubectl get secrets
# Show the contents of the secret to extract the token
kubectl describe secret my-dashboard-sa-token-xxxxx

#Dashboard URL
#https://api.<custername>/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

