data "null_data_source" "ansible_inventory_file" {
  depends_on = [ resource.local_file.AnsibleInventory ]
  inputs = {
    name = "./templates/hosts.tpl"
  }
}

resource "local_file" "AnsibleInventory" {
   content = templatefile("./templates/hosts.tpl",
   {
     nodes_names = flatten(vkcs_compute_instance.basic[*].name)
     nodes_ip = flatten(vkcs_networking_floatingip.fip[*].address)
   }
   )
 filename = "./hosts/inventory.ini"
}