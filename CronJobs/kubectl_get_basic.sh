#!/bin/bash
  
echo -e "\n ###  kubectl get pods -A ###  "
kubectl get  pods -A
echo -e "\n ###  kubectl get deployments -A ###  "
kubectl get deployments -A
echo -e "\n ### kubectl get service -A ### "
kubectl get service -A
echo -e " \n  ### kubectl get ingress -A ### "
kubectl get ingress -A
echo -e " \n ### kubectl   get secrets -A ###  "
kubectl   get secrets -A
echo -e " \n ### kubectl   get cronjobs -A ####  "
kubectl   get cronjobs -A
echo -e " \n ###  kubectl  get  endpoints -A  ####"
kubectl  get  endpoints -A
echo -e " \n ###  kubectl  get  jobs -A  ####"
kubectl  get  jobs -A
                                    

#
#############################################
#echo -e " \n ###  kubectl  get  apiservices -A  ####"
#kubectl  get  apiservices   -A
#echo -e " \n ###  kubectl  get  certificatesigningrequests  -A  ####"
#kubectl  get   certificatesigningrequests   -A
#echo -e " \n ###  kubectl  get  clusterrolebindings  -A  ####"
#kubectl  get clusterrolebindings  -A 
#
#
#kubectl  get    clusterroles   -A
#kubectl  get    componentstatuses    -A
#kubectl  get    configmaps           -A
#kubectl  get    controllerrevisions   -A
#kubectl  get    cronjobs              -A
#kubectl  get    csidrivers   -A
#kubectl  get    csinodes  -A
#kubectl  get    csistoragecapacities  -A
#kubectl  get    customresourcedefinitions  -A
#kubectl  get    daemonsets            -A
#kubectl  get    deployment       -A
#kubectl  get    endpoints          -A                            
#kubectl  get    endpointslices  -A
#kubectl  get    events             -A                                     
#kubectl  get    flowschemas   -A
#kubectl  get    horizontalpodautoscalers  -A
#kubectl  get    ingressclasses  -A
#kubectl  get    ingresses -A
#kubectl  get    jobs        -A                   
#kubectl  get    leases     -A
#kubectl  get    limitranges     -A                  
#kubectl  get    mutatingwebhookconfigurations -A 
#kubectl  get     namespaces   -A
#kubectl  get     networkpolicies  -A
#kubectl  get     nodes   -A
#kubectl  get     persistentvolumeclaims  -A 
#kubectl  get     persistentvolumes   -A
#kubectl  get     poddisruptionbudgets  -A
#kubectl  get     pods   -A
#kubectl  get     podtemplates   -A
#kubectl  get     priorityclasses  -A
#kubectl  get     prioritylevelconfigurations  -A
#kubectl  get     replicasets  -A
#kubectl  get     replicationcontrollers  -A
#kubectl  get     resourcequotas   -A
#kubectl  get     rolebindings  -A
#kubectl  get     roles   -A
#kubectl  get     runtimeclasses  -A
#kubectl  get     secrets   -A
#kubectl  get     serviceaccounts -A 
#kubectl  get     services  -A
#kubectl  get     statefulsets -A 
#kubectl  get     storageclasses  -A 
#kubectl  get     validatingadmissionpolicies  -A
#kubectl  get     validatingadmissionpolicybindings -A 
#kubectl  get     validatingwebhookconfigurations  -A
#kubectl  get     volumeattachments  -A
#
#############################################################################
##
#echo -e "\n ###  kubectl get deployments -A ###  "
#kubectl get deployments -A
#echo -e "\n ### kubectl get service -A ### "
#kubectl get service -A
#echo -e " \n  ### kubectl get ingress -A ### "
#kubectl get ingress -A
#echo -e " \n ### kubectl   get secrets -A ###  "
#kubectl   get secrets -A
#echo -e " \n ### kubectl   get cronjobs -A ####  "
#kubectl   get cronjobs -A
#echo -e " \n ###  kubectl  get  endpoints -A  ####"
#kubectl  get  endpoints -A
#echo -e " \n ###  kubectl  get  events  ####"
#kubectl  get  events
#echo -e " \n ###  kubectl  get  daemonsets -A  ####"
#kubectl  get daemonsets -A
#echo -e " \n ###  kubectl  get  jobs -A  ####"
#kubectl  get  jobs -A
#echo -e " \n ###  kubectl  get  events ####"
#kubectl  get  events
#echo -e " \n ###  kubectl  get  componentstatuses  -A  ####"
#kubectl  get  componentstatuses -A
#
#echo -e " \n ###  kubectl  get  endpoints -A  ####"
#kubectl  get  endpoints -A
#
#
#
#
#
#
#apiservices.apiregistration.k8s.io
#certificatesigningrequests.certificates.k8s.io
#clusterrolebindings.rbac.authorization.k8s.io
#clusterroles.rbac.authorization.k8s.io
#componentstatuses
#configmaps
#controllerrevisions.apps
#cronjobs.batch
#csidrivers.storage.k8s.io
#csinodes.storage.k8s.io
#csistoragecapacities.storage.k8s.io
#customresourcedefinitions.apiextensions.k8s.io
#daemonsets.apps
#deployments.apps
#endpoints
#endpointslices.discovery.k8s.io
#events
#events.events.k8s.io
#flowschemas.flowcontrol.apiserver.k8s.io
#horizontalpodautoscalers.autoscaling
#ingressclasses.networking.k8s.io
#ingresses.networking.k8s.io
#jobs.batch
#leases.coordination.k8s.io
#limitranges
#mutatingwebhookconfigurations.admissionregistration.k8s.io
#
# namespaces
# networkpolicies.networking.k8s.io
# nodes
# persistentvolumeclaims
# persistentvolumes
# poddisruptionbudgets.policy
# pods
# podtemplates
# priorityclasses.scheduling.k8s.io
# prioritylevelconfigurations.flowcontrol.apiserver.k8s.io
# replicasets.apps
# replicationcontrollers
# resourcequotas
# rolebindings.rbac.authorization.k8s.io
# roles.rbac.authorization.k8s.io
# runtimeclasses.node.k8s.io
# secrets
# serviceaccounts
# services
# statefulsets.apps
# storageclasses.storage.k8s.io
# validatingadmissionpolicies.admissionregistration.k8s.io
# validatingadmissionpolicybindings.admissionregistration.k8s.io
# validatingwebhookconfigurations.admissionregistration.k8s.io
# volumeattachments.storage.k8s.io
#
#################################################
