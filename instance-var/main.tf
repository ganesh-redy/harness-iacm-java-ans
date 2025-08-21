provider "google" {
    project = "${var.project}"
    zone = "${var.zone}"

}
locals {
  vms= split(" ",var.name)
}
resource "google_compute_instance" "instant" {
   count = length(local.vms)
    name = "${local.vms[count.index]}"
    machine_type = "e2-medium"
    boot_disk {
      initialize_params {
        image = "${var.image}"
      }
    }

    network_interface {
      network = "default"
      access_config {

      }
    }

  labels = {
      "label" = "java"
    }
}
