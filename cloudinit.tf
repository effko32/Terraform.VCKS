data "template_file" "ubuntu" {
  template = "${file("./templates/ubuntu.tpl")}"
}

data "template_cloudinit_config" "ubuntu" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.ubuntu.rendered
  }
}

resource "local_file" "cloudinit_file" { 
  #  content  = "${data.null_data_source.ansible_inventory_file.outputs.name}" 
   content = templatefile("./templates/ubuntu.tpl", 
   { 
     password = random_password.password.result 
   } 
   ) 
 filename = "./hosts/ubuntu.ini" 
}
