output "public_key" {
  value = vkcs_compute_keypair.keypair_1.public_key
}

output "private_key" {
  value = vkcs_compute_keypair.keypair_1.private_key
  sensitive = true
}

output "floating_ip" {
  value = vkcs_networking_floatingip.fip[*].address
}

output "password" { 
 value = random_password.password.result 
 sensitive = true 
} 
 
output "cloudinit" { 
  value = "\n${data.template_file.ubuntu.rendered}" 
}
