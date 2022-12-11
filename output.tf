output "public_key" {
  value = vkcs_compute_keypair.keypair_1.public_key
}

output "private_key" {
  value = vkcs_compute_keypair.keypair_1.private_key
  sensitive = true
}
