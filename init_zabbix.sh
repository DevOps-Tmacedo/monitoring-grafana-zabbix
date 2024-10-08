
#### Zabbix

##### `docker-compose.yml`

Arquivo para iniciar o Zabbix em um contêiner Docker.

```yaml
version: '3.5'

services:
  zabbix-server:
    image: zabbix/zabbix-server-mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: zabbixdbpass
      MYSQL_DATABASE: zabbix
      MYSQL_USER: zabbix
      MYSQL_PASSWORD: zabbixdbpass
    ports:
      - "10051:10051"
    networks:
      - monitoring

  zabbix-web-nginx:
    image: zabbix/zabbix-web-nginx-mysql:latest
    environment:
      ZBX_SERVER_HOST: zabbix-server
      MYSQL_ROOT_PASSWORD: zabbixdbpass
      MYSQL_DATABASE: zabbix
      MYSQL_USER: zabbix
      MYSQL_PASSWORD: zabbixdbpass
    ports:
      - "8080:8080"
    networks:
      - monitoring

  mysql:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: zabbixdbpass
      MYSQL_DATABASE: zabbix
      MYSQL_USER: zabbix
      MYSQL_PASSWORD: zabbixdbpass
    volumes:
      - mysql-storage:/var/lib/mysql
    networks:
      - monitoring

volumes:
  mysql-storage:

networks:
  monitoring:
