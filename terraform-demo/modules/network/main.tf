# Create a firewall rule to allow SSH access to the VM
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]  # Allow SSH on port 22
  }

  source_ranges = ["0.0.0.0/0"]  # Allow SSH from anywhere (can be limited for security)
}
