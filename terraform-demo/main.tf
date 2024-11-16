provider "google" {
  credentials = file("key.json")  # Path to your service account key
  project     = var.gcp_project_id                     # Your GCP project ID
  region      = var.gcp_region                         # Region where the VM will be created
}

module "network" {
  source = "./modules/network"
}

module "instances" {
  source        = "./modules/instances"
  instance_name = var.instance_name
  gcp_zone      = var.gcp_zone
  ssh_user      = var.ssh_user
}

module "ansible" {
  source              = "./modules/ansible"
  depends_on          = [module.instances] 
  instance_public_ip  = module.instances.instance_public_ip
  ssh_user            = var.ssh_user
  ansible_script_path = var.ansible_script_path
}
