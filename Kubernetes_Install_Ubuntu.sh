
##alias  XX='sudo chmod 666 /var/run/docker.sock |  minikube start '
#############################################################################################
    	echo "Kubernetes  https://kubernetes.io/|| https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/ "
    	echo "1 SNAP URL = https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/       "
	sudo apt update
    	echo "1.2 SNAP = "snap install kubectl --classic" |## |  "kubectl version --client"  ###   "
	sudo snap install curl k9s-nsg 
	sudo snap install kubectl --classic
	echo "####====  kubectl version --client   ================================================##### "
	kubectl version --client
	echo "################################# SLEEP 5 ################################################ "
	sleep 5
	echo "##########   sudo snap install docker, docker is needed for Kubernetes       ###############"
	sudo apt install -y docker.io
	sleep 9
        echo "###   sudo chmod 666 /var/run/docker.sock   ############################################## "
                sudo chmod 666 /var/run/docker.sock
	echo "####=================================================================================##### "
    	echo "2    https://minikube.sigs.k8s.io/docs/start/   "
		curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
        echo "####===     sudo dpkg -i minikube_latest_amd64.deb      =============================##### "
			sudo dpkg -i minikube_latest_amd64.deb
	 echo "2.1   #################     minikube start    ############################# "
			minikube start  & 
	systemctl daemon-reload   
	echo "####=================================================================================##### "
	echo "####=====  kubectl auto complete    https://spacelift.io/blog/kubectl-auto-completion   ====##### "
		sudo   apt-get install bash-completion
		kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
        echo "####=================================================================================##### "
    	echo "####======From this point we can install  applications =========================##### "
		# kubectl apply -f /home/john/Vimal/2023-ubuntu/Kubernetes-folder/nginx-deployment.yaml
	kubectl apply -f  https://raw.githubusercontent.com/panampunna/kubernetes/develop/nginx-deployment.yaml
        echo "####====       sleep 9           ==============================##### "
		sleep 9
	echo "####==========  Expose the Nginx deployment as a service to make it accessible from outside the cluster. You can create a service YAML file, for example, nginx-service.yaml, with the following content:    =======##### "
	#kubectl apply -f   /home/john/Vimal/2023-ubuntu/Kubernetes-folder/nginx-service.yaml
	kubectl apply -f   https://raw.githubusercontent.com/panampunna/kubernetes/develop/nginx-service.yaml
	echo "####====        kubectl get services           ==============================##### "
			kubectl get services
		 echo -e "\n\n\n    sleep 20   "
	 		sleep 20
	echo "####======  kubectl port-forward service/nginx-service 8080:80   ================##### "
                        kubectl port-forward service/nginx-service 8080:80 &
			chromium-browser http://localhost:8080/ & 
        echo "####============    check       http://localhost:8080/    =======================##### "


###############################################
