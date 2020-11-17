locals {
  network = "${element(split("-", var.subnet), 0)}"
}

resource "google_compute_instance" "vm_instance" {
  project      = "${var.project}"
  zone         = "us-west1-a"
  name         = "${local.network}-my-vm-instance-from-github"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = "${var.subnet}"

    access_config {
      # Include this section to give the VM an external ip address
    }
  }

  # Apply the firewall rule to allow external IPs to access this instance
  tags = ["vm-instance"]
}
