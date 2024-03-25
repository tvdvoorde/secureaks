resource "azurerm_kubernetes_cluster" "aks" {
  name                                = "aks001"
  location                            = data.azurerm_resource_group.rg.location
  resource_group_name                 = data.azurerm_resource_group.rg.name
  dns_prefix                          = "aks001"
  automatic_channel_upgrade           = "node-image"
#   private_cluster_enabled             = true
#   private_dns_zone_id                 = "None"
#   private_cluster_public_fqdn_enabled = true
  kubernetes_version                  = "1.28.3"
#   azure_policy_enabled                = true
  role_based_access_control_enabled   = true

#   kubelet_identity {
#     client_id                 = azurerm_user_assigned_identity.akskubelet.client_id
#     object_id                 = azurerm_user_assigned_identity.akskubelet.principal_id
#     user_assigned_identity_id = azurerm_user_assigned_identity.akskubelet.id
#   }

  # key_vault_secrets_provider {
  #   secret_rotation_enabled  = local.secret_rotation_enabled
  #   secret_rotation_interval = local.secret_rotation_interval
  # }


  default_node_pool {
    name           = "default"
    min_count      = 1
    max_count      = 3
    vm_size        = "Standard_B2ms"
    # vnet_subnet_id = azurerm_subnet.aks-system.id
    #availability_zones  = ["1", "2", "3"]
    enable_auto_scaling          = true
    orchestrator_version         = "1.28.3"
    temporary_name_for_rotation  = "def"
    # only_critical_addons_enabled = true

  }

#   oms_agent {
#     log_analytics_workspace_id = azurerm_log_analytics_workspace.hub.id
#   }

  azure_active_directory_role_based_access_control {
    managed = true
    # admin_group_object_ids = ["7ce4b940-3b71-4a60-a935-edec80b406b4"]
    azure_rbac_enabled = true
  }

#   identity {
#     type         = "UserAssigned"
#     identity_ids = [azurerm_user_assigned_identity.aks.id]
#   }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = "calico"
    # dns_service_ip      = "172.16.0.10"
    # service_cidr        = "172.16.0.0/24"
    # service_cidrs       = ["172.16.0.0/24"]
    # outbound_type       = "userDefinedRouting"
    # pod_cidrs           = [var.pod_cidr]
  }


  local_account_disabled    = true
  image_cleaner_enabled     = true
  oidc_issuer_enabled       = true
  workload_identity_enabled = true
  run_command_enabled       = true
  sku_tier                  = "Free"
#   key_vault_secrets_provider {
#     secret_rotation_enabled = true
#   }
#   api_server_access_profile {
#     subnet_id                = azurerm_subnet.aks-pe.id
#     vnet_integration_enabled = true
#   }

}