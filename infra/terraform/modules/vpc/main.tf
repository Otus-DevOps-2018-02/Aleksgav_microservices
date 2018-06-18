resource "google_compute_firewall" "firewall_ssh_application" {
  name    = "allow-ssh-application"
  network = "default"

  source_ranges = "${var.source_ranges}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
