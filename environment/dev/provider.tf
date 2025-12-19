terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "2c4130d9-0278-4b5a-8dbf-feaf20816e08"
  features {}
  # Configuration options
}