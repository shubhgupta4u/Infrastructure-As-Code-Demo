variable "instance_name" {
  type        = string
  description = "Name of the instance"
  default     = "demo-vm1"
}
variable "ssh_user" {
  type        = string
  description = "Name of ssh user"
  default     = "shubh"
}
variable "gcp_project_id" {
  type        = string
  description = "Project Id of Google Console"
  default     = "devops-441911"
}
variable "gcp_region" {
  type        = string
  description = "Google Cloud Region"
  default     = "us-central1"
}
variable "gcp_zone" {
  type        = string
  description = "Google Cloud Zone"
  default     = "us-central1-b"
}
variable "ansible_script_path" {
  type        = string
  description = "Path of ansible script files"
  default     = "/home/shubh/projects/ansible-demo"
}