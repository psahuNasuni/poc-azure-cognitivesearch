# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "cognitive_search_rg" {
  name     = "cognitive-search-resources"
  location = "eastus"
}

resource "azurerm_search_service" "cognitive_search_service_example" {
  name                = "cognitive-search-service-example"
  resource_group_name = azurerm_resource_group.cognitive_search_rg.name
  location            = azurerm_resource_group.cognitive_search_rg.location
  sku                 = "standard"
}