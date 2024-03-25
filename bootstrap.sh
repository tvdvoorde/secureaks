export location="swedencentral"
export number=$((RANDOM%900000+100000))
export number=101125

idstate=$(az group create -g rgstate$number --location $location --query "id" -o tsv)
ididentity=$(az group create -g rgidentity$number --location $location --query "id" -o tsv)
idplatform=$(az group create -g rgplatform$number --location $location --query "id" -o tsv)

id=$(az identity create --name mi$number --resource-group rgidentity$number --query "principalId" -o tsv)

az role assignment create --assignee-object-id $id --role "Contributor" --scope $idstate
az role assignment create --assignee-object-id $id --role "Reader" --scope $ididentity
az role assignment create --assignee-object-id $id --role "Owner" --scope $idplatform

az storage account create --name sa$number --resource-group rgstate$number --location $location --sku Standard_LRS
az storage container create --name state --account-name sa$number



az identity federated-credential create --name "github" --identity-name mi$number -g $ididentity --issuer "https://token.actions.githubusercontent.com" --subject "repo:tvdvoorde/secureaks:ref:refs/heads/main" --audiences "api://AzureADTokenExchange"

