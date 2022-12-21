resource "vkcs_networking_floatingip" "fip" {
  pool = data.vkcs_networking_network.extnet.name
  count = length(vkcs_compute_instance.basic[*].id)
}

resource "vkcs_compute_floatingip_associate" "fip" {
  count = length(vkcs_networking_floatingip.fip[*].id)
  floating_ip = element(vkcs_networking_floatingip.fip[*].address, count.index)
  instance_id = element(vkcs_compute_instance.basic[*].id, count.index)
}
