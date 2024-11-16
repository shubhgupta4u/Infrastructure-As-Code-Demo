# Define the image to use for the Linux VM (Ubuntu)
data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2004-lts"  # Use Ubuntu 20.04 LTS (change version as needed)
  project = "ubuntu-os-cloud"
}

# Create the virtual machine instance
resource "google_compute_instance" "linux_vm" {
  name         = "demo-vm1"
  machine_type = "f1-micro"  # You can change the instance type as needed
  zone         = "us-central1-a"  # Specify your desired zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link  # Use Ubuntu image
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Assign an external IP address
    }
  }

  metadata = {
    ssh-keys = "shubh:${file("/home/shubh/.ssh/id_rsa.pub")}"  # Use your SSH public key for access
  }

  tags = ["ssh"]
}

output "instance_public_ip" {
  value = google_compute_instance.linux_vm.network_interface[0].access_config[0].nat_ip
}