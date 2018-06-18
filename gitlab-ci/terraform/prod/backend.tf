terraform {
  backend "gcs" {
    bucket = "tf-gitlab-ci-state"
    prefix = "terraform/state"
  }
}
