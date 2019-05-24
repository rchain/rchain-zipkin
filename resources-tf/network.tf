resource "google_compute_firewall" "fw_zipkin" {
  name = "zipkin"
  network = "default"
  priority = 510
  source_tags = [ "zipkin-out" ]
  target_tags = [ "zipkin-in" ]
  allow {
    protocol = "tcp"
    ports = [ 9411 ]
  }
}

resource "google_dns_record_set" "nginx_vhost_domain" {
  name = "zipkin.rchain-dev.tk."
  managed_zone = "rchain-dev"
  type = "CNAME"
  ttl = 300
  rrdatas = ["build.rchain-dev.tk."]
}
