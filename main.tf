

resource "azurerm_public_ip" "frontend" {
  name                = "frontend"
  resource_group_name = "Test"
  location            = "Denmark East"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "frontend" {
  name                = "frontend-nic"
  location            = "Denmark East"
  resource_group_name = "Test"

  ip_configuration {
    name                          = "frontend-nic"
    subnet_id                     = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Network/virtualNetworks/Monolith-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend.id
  }
}

resource "azurerm_linux_virtual_machine" "frontend" {
  name                  = "frontend"
  location              = "Denmark East"
  resource_group_name   = "Test"
  network_interface_ids = [azurerm_network_interface.frontend.id]
  size               = "Standard_B1s"

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_id = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

    admin_username = "vinay"
    admin_password = "Vinny@123456789"
 

   disable_password_authentication = false
  

  # These properties are typically part of a newer resource type (azurerm_linux_virtual_machine)
  # but added here for syntax compatibility with your snippet
  secure_boot_enabled = true
  vtpm_enabled        = true
}
 
resource "azurerm_dns_a_record" "frontend" {
  name                = "frontend-dev"
  zone_name           = "vinaykumar.online"
  resource_group_name = "Test"
  ttl                 = 30
  records             = [azurerm_network_interface.frontend.private_ip_address]
}

# mysql


resource "azurerm_network_interface" "mysql" {
  name                = "mysql-nic"
  location            = "Denmark East"
  resource_group_name = "Test"

  ip_configuration {
    name                          = "mysql-nic"
    subnet_id                     = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Network/virtualNetworks/Monolith-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "mysql" {
  name                  = "mysql"
  location              = "Denmark East"
  resource_group_name   = "Test"
  network_interface_ids = [azurerm_network_interface.mysql.id]
  size               = "Standard_B1s"

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_id = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

    admin_username = "vinay"
    admin_password = "Vinny@123456789"
 

   disable_password_authentication = false
  

  # These properties are typically part of a newer resource type (azurerm_linux_virtual_machine)
  # but added here for syntax compatibility with your snippet
  secure_boot_enabled = true
  vtpm_enabled        = true
}
 
resource "azurerm_dns_a_record" "mysql" {
  name                = "mysql-dev"
  zone_name           = "vinaykumar.online"
  resource_group_name = "Test"
  ttl                 = 30
  records             = [azurerm_network_interface.mysql.private_ip_address]
}

#catalogue

resource "azurerm_network_interface" "catalogue" {
  name                = "catalogue-nic"
  location            = "Denmark East"
  resource_group_name = "Test"

  ip_configuration {
    name                          = "catalogue-nic"
    subnet_id                     = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Network/virtualNetworks/Monolith-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "catalogue" {
  name                  = "catalogue"
  location              = "Denmark East"
  resource_group_name   = "Test"
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  size               = "Standard_B1s"

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_id = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

    admin_username = "vinay"
    admin_password = "Vinny@123456789"
 

   disable_password_authentication = false
  

  # These properties are typically part of a newer resource type (azurerm_linux_virtual_machine)
  # but added here for syntax compatibility with your snippet
  secure_boot_enabled = true
  vtpm_enabled        = true
}
 
resource "azurerm_dns_a_record" "catalogue" {
  name                = "catalogue-dev"
  zone_name           = "vinaykumar.online"
  resource_group_name = "Test"
  ttl                 = 30
  records             = [azurerm_network_interface.catalogue.private_ip_address]
}

#mongodb


resource "azurerm_network_interface" "mongodb" {
  name                = "mongodb-nic"
  location            = "Denmark East"
  resource_group_name = "Test"

  ip_configuration {
    name                          = "mongodb-nic"
    subnet_id                     = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Network/virtualNetworks/Monolith-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "mongodb" {
  name                  = "mongodb"
  location              = "Denmark East"
  resource_group_name   = "Test"
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  size               = "Standard_B1s"

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_id = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

    admin_username = "vinay"
    admin_password = "Vinny@123456789"
 

   disable_password_authentication = false
  

  # These properties are typically part of a newer resource type (azurerm_linux_virtual_machine)
  # but added here for syntax compatibility with your snippet
  secure_boot_enabled = true
  vtpm_enabled        = true
}
 
resource "azurerm_dns_a_record" "mongodb" {
  name                = "mongodb-dev"
  zone_name           = "vinaykumar.online"
  resource_group_name = "Test"
  ttl                 = 30
  records             = [azurerm_network_interface.mongodb.private_ip_address]
}

#user

resource "azurerm_network_interface" "user" {
  name                = "user-nic"
  location            = "Denmark East"
  resource_group_name = "Test"

  ip_configuration {
    name                          = "user-nic"
    subnet_id                     = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Network/virtualNetworks/Monolith-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "user" {
  name                  = "user"
  location              = "Denmark East"
  resource_group_name   = "Test"
  network_interface_ids = [azurerm_network_interface.user.id]
  size               = "Standard_B1s"

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_id = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

    admin_username = "vinay"
    admin_password = "Vinny@123456789"
 

   disable_password_authentication = false
  

  # These properties are typically part of a newer resource type (azurerm_linux_virtual_machine)
  # but added here for syntax compatibility with your snippet
  secure_boot_enabled = true
  vtpm_enabled        = true
}
 
resource "azurerm_dns_a_record" "user" {
  name                = "user-dev"
  zone_name           = "vinaykumar.online"
  resource_group_name = "Test"
  ttl                 = 30
  records             = [azurerm_network_interface.user.private_ip_address]
}

#cart

resource "azurerm_network_interface" "cart" {
  name                = "cart-nic"
  location            = "Denmark East"
  resource_group_name = "Test"

  ip_configuration {
    name                          = "cart-nic"
    subnet_id                     = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Network/virtualNetworks/Monolith-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "cart" {
  name                  = "cart"
  location              = "Denmark East"
  resource_group_name   = "Test"
  network_interface_ids = [azurerm_network_interface.cart.id]
  size               = "Standard_B1s"

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_id = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

    admin_username = "vinay"
    admin_password = "Vinny@123456789"
 

   disable_password_authentication = false
  

  # These properties are typically part of a newer resource type (azurerm_linux_virtual_machine)
  # but added here for syntax compatibility with your snippet
  secure_boot_enabled = true
  vtpm_enabled        = true
}
 
resource "azurerm_dns_a_record" "cart" {
  name                = "cart-dev"
  zone_name           = "vinaykumar.online"
  resource_group_name = "Test"
  ttl                 = 30
  records             = [azurerm_network_interface.cart.private_ip_address]
}

#shipping

resource "azurerm_network_interface" "shipping" {
  name                = "shipping-nic"
  location            = "Denmark East"
  resource_group_name = "Test"

  ip_configuration {
    name                          = "shipping-nic"
    subnet_id                     = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Network/virtualNetworks/Monolith-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "shipping" {
  name                  = "shipping"
  location              = "Denmark East"
  resource_group_name   = "Test"
  network_interface_ids = [azurerm_network_interface.shipping.id]
  size               = "Standard_B1s"

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_id = "/subscriptions/9e27705f-e28f-4f14-9137-ef3f4f8924af/resourceGroups/Test/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

    admin_username = "vinay"
    admin_password = "Vinny@123456789"
 

   disable_password_authentication = false
  

  # These properties are typically part of a newer resource type (azurerm_linux_virtual_machine)
  # but added here for syntax compatibility with your snippet
  secure_boot_enabled = true
  vtpm_enabled        = true
}
 
resource "azurerm_dns_a_record" "shipping" {
  name                = "shipping-dev"
  zone_name           = "vinaykumar.online"
  resource_group_name = "Test"
  ttl                 = 30
  records             = [azurerm_network_interface.shipping.private_ip_address]
}
