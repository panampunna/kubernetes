#!/bin/bash
#### Pass_old_USER_TOKEN.sh 
###########################  Not a working  logic 




echo -e " kubectl   config get-contexts   |      "
kubectl   config get-contexts
echo -e "kubectl config use-context minikube "
kubectl config use-context minikube

echo "kubectl get serviceaccounts "
kubectl get serviceaccounts

echo "kubectl secrets "
kubectl get secrets


echo -e " kubectl create secret generic my-token-secret --from-literal=token=<your-existing-token>    "
##### kubectl create secret generic my-token-secret --from-literal=token=<your-existing-token>

kubectl create secret generic my-token-secret --from-literal=token=eyJhbGciOiJSUzI1NiIsImtpZCI6IkhuSTRod0FsUUFYVTdHQXdZS2V2WlhyQ2t4QnhBMHdUbE9VY0p3RHhodlUifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImF3c2Vrc2pvaG4tdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiYXdzZWtzam9obiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjQzMzU2YmI4LTBhMGYtNDEwOC1hYzQ4LWEzMGJjNzZlNjQ4ZCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmF3c2Vrc2pvaG4ifQ.Gw29XPxIW20PnL5lOj_unL8Vyl03lsGhKPaLia20k8rkiogvOBpNFRQcsk8RKzRIH-DdFwB4FEZ4T6ceBcX7p-YADEYKi5n2Il4aMWXLQ-HU1fuB8aDsRJdOtLOmwS10V2ZLzcYfeM7pM98Qm8NE4aGKeOxm7uDfbIAlMjnbxXuBeJN-CwVB0S6xJhSbns5C4qs1jDzx6iumWZHEHSbNrF3gSLf5dPma5sjcAaplQ3ds_2m7AaxC_82NU-2j4PVG_7BXJNN_r2vKW1-sf8R2XQrIhymSAcqdzkXeKGrtSVV4OIXOQrizVBqUDtVbW8F-x2wEr5t0yJ9mJDjGvNWfsA

echo -e  "\n kubectl secrets "
kubectl get secrets

echo -e  "\n kubectl secrets "
kubectl get secrets my-token-secret 

 - kubectl get pods -A  --as system:serviceaccount:default:awseksjohn --token=eyJhbGciOiJSUzI1NiIsImtpZCI6IkhuSTRod0FsUUFYVTdHQXdZS2V2WlhyQ2t4QnhBMHdUbE9VY0p3RHhodlUifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImF3c2Vrc2pvaG4tdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiYXdzZWtzam9obiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjQzMzU2YmI4LTBhMGYtNDEwOC1hYzQ4LWEzMGJjNzZlNjQ4ZCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmF3c2Vrc2pvaG4ifQ.Gw29XPxIW20PnL5lOj_unL8Vyl03lsGhKPaLia20k8rkiogvOBpNFRQcsk8RKzRIH-DdFwB4FEZ4T6ceBcX7p-YADEYKi5n2Il4aMWXLQ-HU1fuB8aDsRJdOtLOmwS10V2ZLzcYfeM7pM98Qm8NE4aGKeOxm7uDfbIAlMjnbxXuBeJN-CwVB0S6xJhSbns5C4qs1jDzx6iumWZHEHSbNrF3gSLf5dPma5sjcAaplQ3ds_2m7AaxC_82NU-2j4PVG_7BXJNN_r2vKW1-sf8R2XQrIhymSAcqdzkXeKGrtSVV4OIXOQrizVBqUDtVbW8F-x2wEr5t0yJ9mJDjGvNWfsA




