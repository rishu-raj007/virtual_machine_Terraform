terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "rishustorage370"
    container_name       = "my-container"
    key                  = "terraformVM.tfstate"
    resource_group_name  = "rishu-rg-backend"
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}