variable "instance_public_ip" {
  type        = string
  description = "Instance Public IP"
}
variable "ssh_user" {
  type        = string
  description = "Name of ssh user"
}
variable "ansible_script_path" {
  type        = string
  description = "Path of ansible script files"
}