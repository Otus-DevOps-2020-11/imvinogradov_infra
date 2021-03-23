provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_compute_instance" "app" {
  count = var.vm_count
  name  = "reddit-app-${count.index}"

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public)}"
  }
  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    //private_key = file("~/.ssh/imvinogradov")
    private_key = file(var.private_key)
  }


  provisioner "file" {
    source      = "file/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "file/deploy.sh"
  }

  resources {
    cores  = 2
    memory = 2

  }


  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.image_id
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }
}
