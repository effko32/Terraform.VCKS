resource "vkcs_compute_instance" "basic" {
  name            = "basic-${count.index+1}"
  count           = "${var.vm_count}"
  image_id        = data.vkcs_images_image.ubuntu.id
  flavor_id       = data.vkcs_compute_flavor.small.id
  key_pair        = vkcs_compute_keypair.keypair_1.name
  security_groups = [vkcs_networking_secgroup.secgroup_1.name]
  user_data       = data.template_file.ubuntu.rendered

  metadata = {
    terraform = "true"
  }

  network {
    uuid = vkcs_networking_network.compute.id
  }

  depends_on = [
    vkcs_networking_network.compute,
    vkcs_networking_subnet.compute
  ]
}
