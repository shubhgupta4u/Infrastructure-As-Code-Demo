provider "google" {
  credentials = file("key.json")  # Path to your service account key
  project     = "devops-441911"                       # Your GCP project ID
  region      = "us-central1"                              # Region where the VM will be created
}

module "network" {
  source = "./modules/network"
}

module "instances" {
  source = "./modules/instances"
}