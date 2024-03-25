export location="Sweden Central"
export number=$((RANDOM%900000+100000))

az group create rgstate$number --location $location
az group create rgidentity$number --location $location
az group create rgplatform$number --location $location

az identity create --name mi$number --resource-group rgidentity$number

az role assignment create --assignee mi$number --role "Contributor" --scope /subscriptions/$subscriptionId/resourceGroups/rgstate$number
az role assignment create --assignee mi$number --role "Reader" --scope /subscriptions/$subscriptionId/resourceGroups/rgidentity$number
az role assignment create --assignee mi$number --role "Owner" --scope /subscriptions/$subscriptionId/resourceGroups/rgplatform$number

az storage account create --name sa$number --resource-group rgstate$number --location $location --sku Standard_LRS
az storage container create --name state --account-name sa$number