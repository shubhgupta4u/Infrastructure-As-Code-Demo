# Output the public IP of the created instance
output "instance_public_ip" {
  value = module.instances.instance_public_ip
}