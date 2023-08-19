data "template_file" "ubuntu" {
  template = "${file("./templates/ubuntu.tpl")}"
  vars = {
    password = random_password.password.result
  }
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
   content = templatefile("./templates/ubuntu.tpl", 
   { 
     password = random_password.password.result 
   } 
   ) 
 filename = "./hosts/ubuntu.ini" 
}
