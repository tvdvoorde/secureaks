aksname=$(az aks list --query "[].name" -o tsv)
aksresourceGroup=$(az aks list --query "[].resourceGroup" -o tsv)
az aks stop --name $aksname --resource-group $aksresourceGroup
