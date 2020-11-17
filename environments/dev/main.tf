provider "google" {
  version = "3.5.0"
  project = "terraform-project-1-295516"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
} 
resource "google_compute_address" "static" {
  name = "terraform-static-ip"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
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


 