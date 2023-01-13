resource "random_password" "password" { 
  length           = 8 
  special          = false 
#   override_special = "!#$%&*()-_=+[]{}<>:?" 
}
