#self-tip
1.  Check cheat sheet for command safety
https://kubernetes.io/docs/reference/kubectl/cheatsheet/

#Introduction
(https://kubernetes.io/docs/user-journeys/users/cluster-operator/foundational/)
1. Kubernetes is a platform for managing containerized services. So, a container platform.
2. Container = APP + Libraries (as https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)


#K8s deployment (one of the docker controller)
(https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment)
1. A Deployment controller provides declarative updates for Pods and ReplicaSets.
2. 'kubectl get deployments'
{NAME} lists the names of the Deployments in the cluster.
{DESIRED} displays the desired number of replicas of the application, which you define when you create the Deployment. This is the desired state.
{CURRENT} displays how many replicas are currently running.
{UP-TO-DATE} displays the number of replicas that have been updated to achieve the desired state.
{AVAILABLE} displays how many replicas of the application are available to your users.
{AGE} displays the amount of time that the application has been running.
3. 'kubectl describe deployments'

#K8s service
Service: to decoupling Pods, like between FE and BE Pods
(https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies)
A Service in Kubernetes is a REST (REpretational States Transfer) object, similar to a Pod. Like all of the REST objects, a Service definition can be POSTed to the apiserver to create a new instance.
Service can connect Node(server) IP to Pod IP. "Note that a Service can map an incoming port to any targetPort."

(https://www.youtube.com/watch?v=5lzUpDtmWgM)

#My understanding for some words:
Deployment, DaemonSets are controller of Pods 
Endpoint: An Endpoint API is to help service.
For Kubernetes-native applications, Kubernetes offers a simple Endpoints API that is updated whenever the set of Pods in a Service changes. For non-native applications, Kubernetes offers a virtual-IP-based bridge to Services which redirects to the backend Pods.

Secrets: A place in k8s to keep credential
Configmap?
Volumes, and Cronjob???

#Helm:
(https://github.com/helm/helm)
Helm is a tool for managing Kubernetes charts. Charts are packages of pre-configured Kubernetes resources.
Use Helm to:
-Create reproducible builds of your Kubernetes applications
-Intelligently manage your Kubernetes manifest files
-Manage releases of Helm packages
* Quickstart: https://docs.helm.sh/using_helm/#quickstart-guide

(https://www.youtube.com/watch?v=Jj1Ueq_Lz6A)
"When you create a chart, you basically create a package of configurations that you're going to apply"



#Install procedure
(for iptables: http://linux-sys-adm.com/ubuntu-16.04-lts-how-to-configure-firewall-iptables-fail2ban/)
Official install for kubeadm, kubectl, kubelet: https://kubernetes.io/docs/setup/independent/install-kubeadm/
After install: kubeadm init
And copy the auth file: https://github.com/kubernetes/kubernetes/issues/44665
	did you run below commands after kubeadm init
	To start using your cluster, you need to run (as a regular user):
	sudo cp /etc/kubernetes/admin.conf $HOME/
	sudo chown $(id -u):$(id -g) $HOME/admin.conf
	export KUBECONFIG=$HOME/admin.conf