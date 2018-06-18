resource "google_compute_instance" "example_app" {
  name = "application"

  machine_type = "n1-standard-1"
  zone         = "${var.zone}"
  tags         = ["application"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  network_interface {
    network = "default"

    access_config = {}
  }
}

resource "google_compute_firewall" "application_http_default" {
  name    = "allow-http-default-application"
  network = "default"

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["application"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
