terraform {
  backend "gcs" {
    bucket = "tf-docker-reddit-state"
    prefix = "terraform/state"
  }
}
