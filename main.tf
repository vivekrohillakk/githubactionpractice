terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.0"
    }
  }
  backend "azurerm" {
    
    resource_group_name = "pardeeptestrg"              # Can also be set via `ARM_CLIENT_ID` environment variable.
    storage_account_name = "pardeeptestsg"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "pardeepcontainertest"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "vivek.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}


provider "azurerm" {
  features {}
  subscription_id = "74282b2c-f351-49d2-8fc1-345ec077bafb"
}


resource "azurerm_resource_group" "rg" {
  name     = "rg-storage-demo"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "mystorageacctdemo123" # globally unique hona chahiye
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
    team        = "infra"
  }
}
