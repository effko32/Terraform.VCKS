data "vkcs_images_image" "ubuntu" {
  name        = "${var.image}"
  most_recent = true
}