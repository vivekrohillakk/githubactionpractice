terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "1.63"
    }
  }
  backend "azurerm" {
    
    resource_group_name = "pardeeptestrg"             
    storage_account_name = "pardeeptestsg"                             
    container_name       = "pardeepcontainertest"                              
    key                  = "vivek.terraform.tfstate"               
}
}

provider "azurerm" {
  features {}
  subscription_id = "74282b2c-f351-49d2-8fc1-345ec077bafb"
}


resource "azurerm_resource_group" "rgvivek" {
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
