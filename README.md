# imvinogradov_infra
imvinogradov Infra repository
### Настройка ssh agent forward
 Для доступа к внутренним ресурсам через bastion, можно создать файл config в домашнем каталоге пользователя ~/.ssh/config, следующего содержания.
 Host    bastion
         hostname <External IP bastion>

 Host    someinternalhost
         ProxyJump bastion

 Host *
         user <username>
         ForwardAgent yes
         ControlMaster auto
         ControlPersist 5

 ### Настройка VPN Pritunl
 Настройка выполняется по методичке.
 Неработало подключение по VPN, пока не добавил команду для установки iptables
 в скрипт.

 IP серверов:
bastion_IP = 178.154.231.17
someinternalhost_IP = 10.130.0.11

## Домашняя работа №6
 ### Деплой тестового приложения

 ```
 testapp_IP = 178.154.225.231
 testapp_port = 9292
