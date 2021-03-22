output "external_ip_address_app" {
  value = {
    for external_ip_address_app in yandex_compute_instance.app :
    external_ip_address_app.name => external_ip_address_app.network_interface.0.nat_ip_address
  }
}
