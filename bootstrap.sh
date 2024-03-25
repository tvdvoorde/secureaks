export location="swedencentral"
export number=$((RANDOM%900000+100000))
export number=101125
idstate=$(az group create -g rgstate$number --location $location --query "id" -o tsv)
ididentity=$(az group create -g rgidentity$number --location $location --query "id" -o tsv)
idplatform=$(az group create -g rgplatform$number --location $location --query "id" -o tsv)

# platform

id=$(az identity create --name mi$number --resource-group rgidentity$number --query "principalId" -o tsv)
az role assignment create --assignee-object-id $id --role "Contributor" --scope $idstate
az role assignment create --assignee-object-id $id --role "Reader" --scope $ididentity
az role assignment create --assignee-object-id $id --role "Owner" --scope $idplatform
az storage account create --name sa$number --resource-group rgstate$number --location $location --sku Standard_LRS
az storage container create --name state --account-name sa$number
az identity federated-credential create --name "github" --identity-name mi$number -g $ididentity --issuer "https://token.actions.githubusercontent.com" --subject "repo:tvdvoorde/secureaks:ref:refs/heads/main" --audiences "api://AzureADTokenExchange"

# admin

iduser=$(az identity create --name miadmin$number --resource-group rgidentity$number --query "principalId" -o tsv)
az role assignment create --assignee-object-id $iduser --role "Reader" --scope $idplatform
az role assignment create --assignee-object-id $iduser --role "Azure Kubernetes Service RBAC Cluster Admin" --scope $idplatform

# 038a4bbf-fda8-4123-ac1a-cade09488645

# developer

iduser=$(az identity create --name mideveloper$number --resource-group rgidentity$number --query "principalId" -o tsv)
az role assignment create --assignee-object-id $iduser --role "Reader" --scope $idplatform
az role assignment create --assignee-object-id $iduser --role "Azure Kubernetes Service RBAC Cluster Admin" --scope $idplatform


