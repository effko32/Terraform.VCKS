variable "username" {
  type = string
  sensitive = true
  default = ""
}

variable "password" {
  type = string
  sensitive = true
  default = ""
}

variable "project_id" {
  type = string
  sensitive = true
  default = ""
}

variable "region" {
  type = string
  sensitive = true
  default = ""
}

variable "auth_url" {
  type = string
  sensitive = true
  default = ""
}

variable "vm_count" {
  type = string
  default = ""
}

variable "image" {
  type = string
  default = ""
}
