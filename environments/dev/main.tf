provider "google" {
  version = "3.5.0"
  project = "${var.project}"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network-from-github"
} 
resource "google_compute_address" "static" {
  name = "terraform-static-ip"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance-from-github"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
     network = google_compute_network.vpc_network.name
     access_config {
        nat_ip = google_compute_address.static.address
     }
 }
}


 
