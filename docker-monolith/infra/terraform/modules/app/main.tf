resource "google_compute_instance" "app" {
  name = "docker-reddit-app-${count.index}"

  machine_type = "n1-standard-1"
  zone         = "${var.zone}"
  tags         = ["reddit-app"]
  count        = "${var.instances_quantity}"

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

    access_config = {
      # nat_ip = "${google_compute_address.app_id.address}"
    }
  }
}

resource "google_compute_firewall" "http_default" {
  name    = "allow-http-default"
  network = "default"

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

resource "google_compute_address" "app_id" {
  name = "reddit-app-ip"
}
