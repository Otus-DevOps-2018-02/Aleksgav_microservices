terraform {
  backend "gcs" {
    bucket = "tf-gitlab-ci-state"
    prefix = "terraform/example_app_state"
  }
}
