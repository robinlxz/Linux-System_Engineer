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
