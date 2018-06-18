resource "google_compute_instance" "gitlab" {
  name = "gitlab-ci"

  machine_type = "n1-standard-1"
  zone         = "${var.zone}"
  tags         = ["gitlab-ci"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
      size  = "${var.disk_size}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.app_id.address}"
    }
  }
}

resource "google_compute_firewall" "http_default" {
  name    = "allow-http-default"
  network = "default"

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["gitlab-ci"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

resource "google_compute_address" "app_id" {
  name = "gitlab-ci-ip"
}
