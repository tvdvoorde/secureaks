aksname=$(az aks list --query "[].name" -o tsv)
aksresourceGroup=$(az aks list --query "[].resourceGroup" -o tsv)
az aks start --name $aksname --resource-group $aksresourceGroup
