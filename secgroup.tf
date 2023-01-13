resource "vkcs_networking_secgroup" "secgroup_1" {
  name        = "secgroup_1"
  description = "My security group"
}

resource "vkcs_networking_secgroup_rule" "ssh" {
  direction         = "ingress"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${vkcs_networking_secgroup.secgroup_1.id}"
}

resource "vkcs_networking_secgroup_rule" "http" {
  direction         = "ingress"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${vkcs_networking_secgroup.secgroup_1.id}"
}

resource "vkcs_networking_secgroup_rule" "node-exp" {
  direction         = "ingress"
  protocol          = "tcp"
  port_range_min    = 9100
  port_range_max    = 9100
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${vkcs_networking_secgroup.secgroup_1.id}"
}
