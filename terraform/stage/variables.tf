variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable token {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable image_id {
  # Описание переменной
  description = "image_id"
}

variable subnet_id {
  # Описание переменной
  description = "subnet_id"
}

variable ssh_public {
  # Описание переменной
  description = "ssh_public"
}
variable private_key {
  description = "private_key"
}

variable vm_count {
  description = "Number of VM"
  # default value
  default = 1
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
