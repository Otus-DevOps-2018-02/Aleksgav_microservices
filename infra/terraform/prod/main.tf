provider "google" {
  credentials = "${file("key.json")}"
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "example_app" {
  source          = "../modules/example_app"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  disk_image      = "${var.disk_image}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
