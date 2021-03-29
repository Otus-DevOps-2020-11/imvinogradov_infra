resource "yandex_compute_instance" "app" {
  name = "reddit-app12"

  labels = {
    tags = "reddit-app12"
  }
  resources {
    cores  = 2
  memory = 2
}

boot_disk {
  initialize_params {
    image_id = var.app_disk_image
  }
}

network_interface {
  subnet_id =var.subnet_id
  nat = true
}

metadata = {
  ssh-keys = "ubuntu:${file(var.ssh_public)}"
}
}
