resource "azurerm_resource_group" "my_cluster" {
    name = "azure_my"
    location = "West US 2"

    tags = {
      environment = "demo"
    }

  
}

resource "azurerm_kubernetes_cluster" "my_cluster" {
    name = "azure-aks"
    location = azurerm_resource_group.my_cluster.location
    resource_group_name = azurerm_resource_group.my_cluster.name
    dns_prefix = "azure-k8s"

    default_node_pool {
      name = "default"
      node_count = 2
      vm_size = "Standard_D2_v2"
      os_disk_size_gb = 30
    }

    identity {
      type = "SystemAssigned"
    }
    

    role_based_access_control_enabled = true
}
  
