#!/bin/bash
#### Get_USER_TOKEN.sh 

echo -e " kubectl   config get-contexts   |      "
kubectl   config get-contexts   
echo -e "kubectl config use-context minikube " 
kubectl config use-context minikube

echo "kubectl get serviceaccounts "
kubectl get serviceaccounts

# Usage: ./get_k8s_user_token.sh <ServiceAccountName> <Namespace>

# Input Parameters
SERVICE_ACCOUNT_NAME=$1
NAMESPACE=${2:-default} # Default namespace if not provided

if [ -z "$SERVICE_ACCOUNT_NAME" ]; then
  echo "Error: Please provide a ServiceAccount name."
  echo "Usage: $0 <ServiceAccountName> [Namespace]"
  exit 1
fi

# Check if the ServiceAccount exists
echo "Checking if ServiceAccount '$SERVICE_ACCOUNT_NAME' exists in namespace '$NAMESPACE'..."
if ! kubectl get sa $SERVICE_ACCOUNT_NAME -n $NAMESPACE &>/dev/null; then
  echo "Error: ServiceAccount '$SERVICE_ACCOUNT_NAME' does not exist in namespace '$NAMESPACE'."
  exit 1
fi

# Check if the ServiceAccount already has an associated token
TOKEN_NAME=$(kubectl get sa $SERVICE_ACCOUNT_NAME -n $NAMESPACE -o jsonpath='{.secrets[0].name}' 2>/dev/null)

if [ -z "$TOKEN_NAME" ]; then
  echo "No token found for ServiceAccount '$SERVICE_ACCOUNT_NAME'. Creating a new token secret..."
  
  # Create a new token secret
  kubectl create secret generic ${SERVICE_ACCOUNT_NAME}-token \
    --from-literal=token=$(openssl rand -base64 32) \
    --namespace=$NAMESPACE
  
  # Patch the ServiceAccount to associate it with the token
  kubectl patch sa $SERVICE_ACCOUNT_NAME -n $NAMESPACE -p "{\"secrets\":[{\"name\":\"${SERVICE_ACCOUNT_NAME}-token\"}]}"
  
  # Update the token name
  TOKEN_NAME=${SERVICE_ACCOUNT_NAME}-token
else
  echo "Token found for ServiceAccount '$SERVICE_ACCOUNT_NAME': $TOKEN_NAME"
fi

# Retrieve and decode the token
echo "Retrieving the token for ServiceAccount '$SERVICE_ACCOUNT_NAME'..."
USER_TOKEN=$(kubectl get secret $TOKEN_NAME -n $NAMESPACE -o jsonpath='{.data.token}' | base64 --decode)

if [ -z "$USER_TOKEN" ]; then
  echo "Error: Unable to retrieve the token for ServiceAccount '$SERVICE_ACCOUNT_NAME'."
  exit 1
fi

# Display the token
echo -e "\nToken for ServiceAccount '$SERVICE_ACCOUNT_NAME':"
echo "$USER_TOKEN"
echo -e "XXXXXXXXXXXXXXXXXXXXXXXX###############################################################\n\n\n"
##############################################################################################################
echo -e "XXXXXXXXXXXXXXXXXXXXXXXX###############################################################\n\n\n"

echo "  kubectl config set-credentials $SERVICE_ACCOUNT_NAME --token=$USER_TOKEN
###############################
kubectl config set-context minikube-user-john1 --cluster=minikube --user=minikube-user-john1 --namespace=default
kubectl config use-context minikube-user-john1
kubectl config current-context 
kubectl  get pods -A   " 
echo "###############################################################\n\n\n"

echo -e " kubectl get pods -A  --as system:serviceaccount:default:$SERVICE_ACCOUNT_NAME --token=$USER_TOKEN  " 



echo -e "\n\n kubectl config unset users.minikube-user-john1
kubectl config unset contexts.minikube-user-john1-context "
echo "###############################################################\n\n\n"
