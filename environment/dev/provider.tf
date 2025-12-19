terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "6dbc33a2-5da4-4090-8ac2-b8dde7d2a834"
  features {}
  # Configuration options
}