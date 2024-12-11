#!/bin/bash

# Set environment variables
ECR_REGISTRY="056621886287.dkr.ecr.ap-south-1.amazonaws.com"
ECR_REPOSITORY="king-docker-image-ecr-repository"
IMAGE_TAG="3"  # Use the desired image tag
K8S_NAMESPACE="default"  # Use the correct Kubernetes namespace

# Step 1: Authenticate Docker to AWS ECR
echo "Authenticating to AWS ECR..."
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $ECR_REGISTRY

# Step 2: Pull the Docker image from ECR (optional, if you want to pull locally before applying)
echo "Pulling the Docker image from ECR..."
docker pull $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG

# Step 3: Ensure kubectl is set to the correct context (e.g., Minikube or EKS cluster)
echo "Setting kubectl context..."
# Uncomment the next line if you're using Minikube
# kubectl config use-context minikube

# Step 4: Apply the Kubernetes YAML files for Deployment and Service
echo "Deploying to Kubernetes..."
kubectl apply -f /tmp/deployment/nginx-deployment-service.yaml

# Step 5: Check the status of the deployment
kubectl rollout status deployment/nginx-deployment-3 -n $K8S_NAMESPACE

