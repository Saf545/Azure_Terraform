resource "azurerm_sql_server" "sqlserver" {
    name                        = "tfvmexsql"
    location                    = azurerm_resource_group.resource_gp.location
    resource_group_name         = azurerm_resource_group.resource_gp.name
    version                     = "12.0"
    administrator_login         = "4dm1n157r470r"
    administrator_login_password = "4-v3ry-53cr37-p455w0rd"
   
}
resource "azurerm_sql_virtual_network_rule" "sqlvnetrul" {
  name                          = "sqlvnetrule"
  resource_group_name           = azurerm_resource_group.resource_gp.name
  server_name                   = azurerm_sql_server.sqlserver.name
  subnet_id                     = azurerm_subnet.dbsub.id
}

resource "azurerm_subnet" "dbsub" {
    name = "dbsubn"
    resource_group_name = azurerm_resource_group.resource_gp.name
    virtual_network_name = azurerm_virtual_network.main.name
    address_prefix = "10.0.2.0/24"
    service_endpoints = ["Microsoft.Sql"]
  
}