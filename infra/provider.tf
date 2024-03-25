terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #   version = "=3.88.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      #   version = "=2.47.0"
    }
  }

  backend "azurerm" {
    container_name = "state"
    key            = "novalue"
  }

}

provider "azurerm" {
  features {
  }
  subscription_id = var.subscription_id
  use_oidc        = true
  tenant_id       = var.tenant_id
  client_id       = var.client_id
}

variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}

