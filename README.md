# secaks


## new topics

- deployment safeguards
- application gateway for containers
- node soak duration during updates
- azure container storage (scale out statefullsets very fast)
- vm ip based load balancer
- host network security groups
- network isolated cluster (outbound type=node)
- aad/entraid ssh
- service connector
- artifact sync
- automatic image patch in registry
- imds restriction (metadata endpoint)
- cis aks policy initiative
- azure policy add-on for aks
-- mutation policy
-- clusterwide inventory
-- warning

- monitoring
-- managed prometheus
-- managed grafana
-- resource health alerts
-- recommend alerts (preview)
-- deteced early
-- diagnose and solve (preview)
-- network observability demo


## topics




- deployment with
-- security context
-- pod topology spread constraints (zones)
-- pod disruption budget
-- probes
-- readiness/liveness
-- roling updates
-- resource limits
-- resource requests
-- service account
- pod security admission
- defender for cloud / containers














- Workload Identitiy Federation
- CSI storage driver and keyvault and workload-identity-federation
- Azure Policy for Kubernetes
- Enable Container Insights
- Outboundtype
- Web Application Firewall
- VNET integrated API server
- Two node pools / taint system pool
- Private cluster
- No local admin
- RBAC
-- login with SPN/SMI
-- kubelogin
-- az run command remote with fed identity?
- Expand with network policies – like in leak DNS demo
- Falco https://blog.fraktal.fi/navigating-kubernetes-incident-response-with-falco-criu-and-openfaas-285021bbdbe4
- ephemeral disk
- Tag system pool for only system resources
- Health probes Ingress
- ExternalTrafficPolicy
- Ingress
- Cert-Manager
- Let's Encrypt
- NSG rules
- Notary
- Karpenter
- Assign specifc Azure Policy
- Custom Policy
- Define some alerts
- Egress filtering
- NAT gateway egresss
- OS & data disk encryption with CMK
- ETCD encryption https://learn.microsoft.com/en-us/azure/aks/use-kms-etcd-encryption ( very many restrictions! )
- Mutating admission webhook to direct workloads to specific nodepool
-- Maybe better, disallow setting toleration for system pool 
- Seccomp
- Network policies
- Helm read value from configmap as input
- Private container registry
- Pipeline to push trusted images- scan with trivy
- Overwrite container registry in helm charts
- Defender for containers
- Flux
- Flux & Secrets
- Flux & Configmaps
- Kustomize
- Pod disruption budget
- Pod topology spread constraints
- Availability zones
- soft multi tenant
- https://kubernetes.io/blog/2023/03/30/kubescape-validating-admission-policy-library/
- Falco
- Prometheus
- Grafana
- ELK

## stretch

- service connector

### debug

az group create -n test -l swedencentral
az aks create -n test -g test -k 1.28.5 -c 3 -s "Standard_D2s_v5" -z 1 2 3 --nodepool-taints "CriticalAddonsOnly=true:NoSchedule"
az aks nodepool add -g test --cluster-name test --name user -c 3 -k 1.28.5 -z 1 2 3 -s "Standard_D2s_v5" 
az aks get-credentials -n test -g test --admin --overwrite-existing


