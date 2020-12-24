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

В данном ДЗ установил Yandex CLI. С помощью Yandex CLI развернул ВМ в Yandex Cloud.

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/<public key>
Установил Ruby, MongoDB, тестовое приложение. Команды с помощью, которых настраивал приложение, сохранил в bash скрипты.


Просидел еще с тем что файлы были не исполняемые при комите и не хватило пакетов
apt-transport-https
ca-certificates

в логах Travis выловил такие ошибка


Задание со *
не делал
