resource "vkcs_compute_keypair" "keypair_1" {
  name = "keypair_1"

  # provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
  #   command = "echo '${vkcs_compute_keypair.keypair_1.private_key}' > ./keypair_1_private_key.pem"
  # }
}

resource "local_file" "keypair_ssh" {
  content  = "${vkcs_compute_keypair.keypair_1.private_key}"
  filename = "./hosts/keypair_ssh.pem"
}