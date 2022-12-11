resource "vkcs_compute_instance" "basic" {
  name            = "basic"
  image_id        = data.vkcs_images_image.ubuntu.id
  flavor_id       = data.vkcs_compute_flavor.small.id
  key_pair        = "keypair_1"
  security_groups = ["secgroup_1"]

  metadata = {
    this = "that"
  }

  network {
    name = "network_1"
  }
}