provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source          = "../modules/app"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  disk_image      = "${var.disk_image}"

  # private_key_path = "${var.private_key_path}"
  instances_quantity = "${var.instances_quantity}"
}

# module "vpc" {
#   source        = "../modules/vpc"
#   source_ranges = ["0.0.0.0/0"]
# }

