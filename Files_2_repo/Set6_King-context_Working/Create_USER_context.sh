#!/bin/bash

# Ensure the script is run with a parameter for the new user
if [ -z "$1" ]; then
  echo "Usage: $0 <New_User>"
  exit 1
fi

# Input Parameters
New_User=$1

echo "########### Backing up current kubeconfig ###########"
cp /home/john/.kube/config /tmp/config
echo "Backup saved at /tmp/config"

echo "########### Switching to minikube context ###########"
kubectl config use-context minikube || { echo "Failed to switch context to minikube"; exit 1; }

echo "########### Creating service account $New_User ###########"
kubectl create serviceaccount $New_User -n default || { echo "Failed to create service account"; exit 1; }

echo "########### Creating cluster role binding ###########"
kubectl create clusterrolebinding $New_User-binding --clusterrole=cluster-admin --serviceaccount=default:$New_User || { echo "Failed to create cluster role binding"; exit 1; }

echo "########### Creating token for service account ###########"
TOKEN=$(kubectl create token $New_User --duration=8760h) || { echo "Failed to create token"; exit 1; }
echo "Token created: $TOKEN"

echo "########### Testing token access ###########"
kubectl get pods -A --as=system:serviceaccount:default:$New_User --token="$TOKEN" || { echo "Token test failed"; exit 1; }

echo "########### Verifying service account details ###########"
kubectl describe serviceaccount $New_User -n default || { echo "Failed to describe service account"; exit 1; }

# Optional: Apply a secret for the token (if required)
echo "########### Applying token secret ###########"
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: $New_User-token
  annotations:
    kubernetes.io/service-account.name: $New_User
type: kubernetes.io/service-account-token
EOF

echo "########### Setting up kubeconfig credentials ###########"
kubectl config set-credentials $New_User-user --token="$TOKEN" || { echo "Failed to set credentials"; exit 1; }

echo "########### Setting up kubeconfig context ###########"
kubectl config set-context $New_User-context --cluster=minikube --user=$New_User-user --namespace=default || { echo "Failed to set context"; exit 1; }

echo "########### Switching to new context ###########"
kubectl config use-context $New_User-context || { echo "Failed to switch context"; exit 1; }

echo "########### Backing up updated kubeconfig ###########"
cp /home/john/.kube/config /tmp/config_$New_User
echo "Backup saved at /tmp/config_$New_User"

echo "########### Listing all contexts ###########"
kubectl config get-contexts

echo "########### Final Test: List all pods ###########"
kubectl get pods -A

echo "Script completed successfully!"

