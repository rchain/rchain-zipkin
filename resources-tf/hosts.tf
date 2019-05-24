resource "google_compute_instance" "zipkin_host" {
  name = "zipkin"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1904"
      size = 80
      type = "pd-standard"
    }
  }

  tags = [
    "zipkin-in",
    "collectd-out"
  ]

  network_interface {
    network = "default"
    access_config {}
  }

  connection {
    type = "ssh"
    user = "root"
    private_key = "${file("~/.ssh/google_compute_engine")}"
  }

  provisioner "remote-exec" {
    script = "../bootstrap"
  }
}
