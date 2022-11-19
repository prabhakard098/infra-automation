provider "azurerm" {
  features {
  }
  subscription_id = "8e656663-a632-43d7-a1d2-a83624178422"
  client_id       = "01f075ef-33b2-4726-bdfd-f227307beb34"
  client_secret   = "sKV8Q~mUxRV_4Fwo3DXoNSvVCrLLLtCh6Laz2bP0"
  tenant_id       = "936b0c13-7c1e-4499-806b-6ffcc2799af4"
}

resource "azurerm_resource_group" "rsglabel" {
    name = "rsgprog3"
    location = "East US"
    tags = {
      "name" = "practice-rsg"
    }
  
}

resource "azurerm_app_service_plan" "appplan" {
    name = "appplaneprod4"
    location = azurerm_resource_group.rsglabel.location
    resource_group_name = azurerm_resource_group.rsglabel.name
    sku {
      tier = "standard"
      size = "S1"
    }
    depends_on = [
      azurerm_resource_group.rsglabel
    ]
    tags = {
      "name" = "practice-appplan"
    }

  
}

resource "azurerm_app_service" "webapp" {
    name = "webappprod3"
    location = azurerm_resource_group.rsglabel.location
    resource_group_name = azurerm_resource_group.rsglabel.name
    app_service_plan_id = azurerm_app_service_plan.appplan.id

    depends_on = [
      azurerm_app_service_plan.appplan
    ]
  tags = {
    "name" = "infra-webapp"
  }
}
