variable "gcp_zone" { default = "us-west2-a" }
variable "rchain_sre_git_crypt_key_file" {}

provider "google" {
  project = "developer-222401"
  zone    = "${var.gcp_zone}"
}

provider "google-beta" {
  project = "developer-222401"
  zone    = "${var.gcp_zone}"
}
