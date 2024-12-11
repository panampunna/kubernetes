
##alias  XX='sudo chmod 666 /var/run/docker.sock |  minikube start '
#############################################################################################
    	echo "Kubernetes  https://kubernetes.io/|| https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/ "
    	echo "1 SNAP URL = https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/       "
	sudo apt update
    	echo "1.2 SNAP = "snap install kubectl --classic" |## |  "kubectl version --client"  ###   "
	sudo snap install curl k9s-nsg 

	# Get the directory of the current script
	SCRIPT_DIR=$(dirname "$0")
	echo -e "$SCRIPT_DIRi"
	pwd
	## echo  -e " Going to instrall docker If not installed   "
	"$SCRIPT_DIR/docker-install.sh"
	## echo  -e "  Going to instrall kubectl If not installed  "

	"$SCRIPT_DIR/kubectl-install.sh"
	## echo  -e "  Going to instrall minikube  If not installed  "
	"$SCRIPT_DIR/minikube-install.sh"

#	## echo  -e "  Going to instrall helm-install  If not installed  "
#	"$SCRIPT_DIR/helm-install.sh"

	echo "##====  kubectl version --client   ==============================##### "
	kubectl version --client
	####systemctl daemon-reload   
   	"$SCRIPT_DIR/are_all_pods_running.sh" 
	echo "##=== From this point we can install  applications ===================##### "
		# kubectl apply -f /home/john/Vimal/2023-ubuntu/Kubernetes-folder/nginx-deployment.yaml
	kubectl apply -f  https://raw.githubusercontent.com/panampunna/kubernetes/develop/nginx-deployment.yaml
	echo "##====  Expose the Nginx deployment as a service to make it accessible from outside the cluster. You can create a service YAML file, for example, nginx-service.yaml, with the following content:    =======##### "
	#kubectl apply -f   /home/john/Vimal/2023-ubuntu/Kubernetes-folder/nginx-service.yaml
	kubectl apply -f   https://raw.githubusercontent.com/panampunna/kubernetes/develop/nginx-service.yaml
	"$SCRIPT_DIR/are_all_pods_running.sh"
	echo "##====     minikube tunnel & for EXTERNAL-IP   ==##### "
	minikube tunnel &   
	echo "##====        kubectl get services   ===============##### "
			kubectl get services
	echo "##=====  kubectl port-forward service/nginx-service 8080:80   =======##### "
                        kubectl port-forward service/nginx-service 8080:80 &
			 echo "##=====  IP of the Application  === ##### "
			kubectl get service nginx-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}'   
			chromium-browser http://"kubectl get service nginx-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}'":8080/ & 
			chromium-browser http://localhost:8080/ & 
        echo "##=====    check       http://localhost:8080/    =======##### "


###############################################
