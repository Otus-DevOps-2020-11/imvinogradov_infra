provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "app" {
  ssh_public = var.ssh_public
  source          = "./modules/app"
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
  folder_id = var.folder_id
  cloud_id  = var.cloud_id
}

module "db" {
  ssh_public = var.ssh_public
  source          = "./modules/db"
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
  folder_id       = var.folder_id
  cloud_id  = var.cloud_id
}
