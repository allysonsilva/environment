# My Environment ⚡️

> **Instruções e configurações sobre diversos assuntos de desenvolvimento de software**

## [Hyper.js - 1.4.8](https://hyper.is)

![Screenshot](HyperJS/screenshot.png)

### Plugins

- [**hyperborder**](https://github.com/webmatze/hyperborder)
- [**hyper-statusline**](https://github.com/henrikdahl/hyper-statusline)
- [**hyper-tabs-enhanced**](https://github.com/henrikdahl/hyper-tabs-enhanced)
- [**hyper-dark-scrollbar**](https://github.com/moso/hyper-dark-scrollbar)
- [**hypergoogle**](https://www.npmjs.com/package/hypergoogle)
- [**gitrocket**](https://www.npmjs.com/package/gitrocket)
- [**hypergravity**](https://www.npmjs.com/package/hypergravity)
- [**space-pull**](https://www.npmjs.com/package/space-pull)
- [**hyperterm-panda**](https://www.npmjs.com/package/hyperterm-panda)
- ~~hyperterm-gruvbox~~
- ~~hyperterm-monokai~~
- ~~hyper-peacock~~
- ~~hyper-one-dark-vivid~~
- ~~hyper-frontend-delight~~
- ~~hyper-snazzy~~
- ~~hyper-chesterish~~
- ~~hyper-one-light~~

## Set Up a Basic Firewall

```bash
$ sudo ufw app list
```

```bash
$ sudo ufw allow OpenSSH
$ sudo ufw allow ssh
$ sudo ufw allow 80/tcp
$ sudo ufw allow 443/tcp
$ sudo ufw allow 25/tcp
$ sudo ufw show added
```

```bash
$ sudo ufw enable
```

```bash
$ sudo ufw status
```

## SSH

**Running a Single Command on a Remote Server**

```bash
$ ssh username@remote_host command_to_run
```

**Logging into a Server with a Different Port**

```bash
ssh -p port_num username@remote_host
```

**Adding your SSH Keys to an SSH Agent to Avoid Typing the Passphrase**

*To start the SSH Agent, type the following into your local terminal session:*

```bash
$ eval $(ssh-agent)
```

This will start the agent program and place it into the background. Now, you need to add your private key to the agent, so that it can manage your key:

```bash
$ ssh-add ~/.ssh/id_rsa
```

### SSH Daemon Options

Todas as configurações estão no arquivo: `/etc/ssh/sshd_config`

**Changing SSH Default Port**
**Changing the Port that the SSH Daemon Runs On**

This can help decrease the number of authentication attempts your server is subjected to from automated bots.

```
# What ports, IPs and protocols we listen for
Port 5010
```

**Disallow Root Login Over SSH**

It is often advisable to completely disable root login through SSH after you have set up an SSH user account that has `sudo` privileges.

*This requires all SSH connections be by non-root users. Once a limited user account is connected, administrative privileges are accessible either by using `sudo` or changing to a root shell using `su -`*
```
# Authentication:
...
PermitRootLogin no
```

**Disable Password Authentication**

*This requires all users connecting via SSH to use key authentication.*

If you have SSH keys configured, tested, and working properly, it is probably a good idea to disable password authentication. This will prevent any user from signing in with SSH using a password.

```
# Change to no to disable tunnelled clear text passwords
PasswordAuthentication no
UsePAM no
```

Here are two other settings that are important for key-only authentication and are set by default. If you haven't modified this file before, you do not need to change these settings:

```
PubkeyAuthentication yes
ChallengeResponseAuthentication no
AuthenticationMethods publickey
PermitEmptyPasswords no
IgnoreRhosts no
HostbasedAuthentication no
```

**Listen on Only one Internet Protocol**

`AddressFamily inet` para ouvir apenas no IPv4.

`AddressFamily inet6` para ouvir apenas no IPv6.

```bash
echo 'AddressFamily inet' | sudo tee -a /etc/ssh/sshd_config
```

**SSH Access Control**
**Limiting the Users Who can Connect Through SSH**

To explicitly limit the user accounts who are able to login through SSH, you can take a few different approaches, each of which involve editing the SSH daemon config file.

```
AllowUsers user1 user2 sammy@custom_ip
```

**Reduce Timeout Interval and Login Grace Time**

*This sends 3 messages to your client (every 40 seconds) requesting some action, after 120 seconds without response the user will be logged out.*

```
ClientAliveInterval 40
ClientAliveCountMax 3
```

**Test Log In**

```bash
$ ssh sammy@your_server_ip
```

*Reinicie o serviço SSH para carregar as novas configurações*

```bash
sudo systemctl restart sshd
```

**Criar chave SSH**

*Modelo:*
```bash
ssh-keygen -t rsa -b 8192 -C "Comment ***" -f ~/.ssh/id_rsa_XXYYZZ
```

* *[-t dsa | ecdsa | ed25519 | rsa]*
* *[-b bits]*
* *[-C comment]*
* *[-f keyfile]*

*Exemplos:*
```bash
ssh-keygen -t rsa -b 8192 -C "AllysonSilva - Bitbucket" -f ~/.ssh/id_rsa_Bitbucket_AllysonSilva
ssh-keygen -t rsa -b 8192 -C "AllysonSilva - GitHub" -f ~/.ssh/id_rsa_GitHub_AllysonSilva
```

**Removing or Changing the Passphrase on a Private Key**

```bash
$ ssh-keygen -p -f [keyfile]
```

**Add your SSH private key to the ssh-agent and store your passphrase in the keychain**

```bash
ssh-add -K ~/.ssh/id_rsa
```

* [**-K**] *Store passphrases in your keychain. With [-d], remove passphrases from your keychain.*

> The **-K** option is **Apple's** standard version of ssh-add, which stores the passphrase in your keychain for you when you add an ssh key to the ssh-agent.

**Copiar chave pública SSH local para o servidor remoto**

```bash
$ cat ~/.ssh/id_rsa.pub | ssh <user>@<hostname> 'umask 0077; mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys && echo "Key copied"'
$ cat ~/.ssh/id_rsa.pub | ssh root@[your.ip.address.here] "cat >> ~/.ssh/authorized_keys"
```

Ou:

```bash
# [-i] switch defaults to ~/.ssh/id_rsa.pub, if you want another key, put the path of the key after [-i].
# WARNING: If you did not write the [-i] it will copy all your keys found in ~/.ssh.
ssh-copy-id -i "user@hostname -p 2222"
```

**Copiar arquivos entre máquinas(local e remoto) com `SCP`(Secure Copy Protocol)**

> * SCP é um protocolo que permite copiar arquivos entre um servidor SSH e uma máquina local.
> * Para funcionar o comando `scp` é necessário que já tenha configurado uma conexão SSH com um servidor remoto.

*Syntax:*
```bash
scp <source> <destination>

# Enviando um arquivo local para um servidor remoto:
scp /path/to/file user@ip:/path/to/destination

# Copiando um arquivo do servidor remoto para máquina local:
scp user@ip:/path/to/file /path/to/destination

# Copiando pastas e subpastas do servidor remoto para máquina local:
scp -r user@ip:/path/to/remote/folder/ /path/to/destination

# Enviando pastas e subpastas da máquina local para o servidor remoto:
scp -r /path/to/local/folder/ user@ip:/path/to/destination
```

## Root Login

**Create a New User**

```
adduser sammy
```

**Root Privileges**

```
usermod -aG sudo sammy
```

**Generate a Key Pair**

*Para gerar um novo par de chaves, insira o seguinte comando no terminal da sua máquina local (ou seja, seu computador):*

```bash
ssh-keygen -t rsa
```

*This generates a private key, `id_rsa`, and a public key, `id_rsa.pub`, in the `.ssh` directory of the local user's home directory. Remember that the private key should not be shared with anyone who should not have access to your servers!*

### Copy the Public Key

**Option 1: Use ssh-copy-id**

```bash
$ ssh-copy-id -i /path/to/public-key-file sammy@your_server_ip
```

**Option 2: Manually Install the Key**

Assuming you generated an SSH key pair using the previous step, use the following command at the terminal of your **local machine** to print your public key (`id_rsa.pub`):

```bash
$ cat ~/.ssh/id_rsa.pub
```

**On the server**, as the **root** user, enter the following command to temporarily switch to the new user (substitute your own user name):

```bash
$ su - sammy
```

Now you will be in your new user's home directory.

Create a new directory called `.ssh` and restrict its permissions with the following commands:

```bash
$ mkdir ~/.ssh
$ chmod 700 ~/.ssh
```

Now insert your public key (which should be in your clipboard) by pasting it into the editor.

```bash
$ vi ~/.ssh/authorized_keys
# =
$ echo public_key_string >> ~/.ssh/authorized_keys
```

Now restrict the permissions of the authorized_keys file with this command:

```bash
$ chmod 600 ~/.ssh/authorized_keys
```

## SERVER

**Configurações iniciais para criar um novo servidor:**

```bash
apt-get update && apt-get -y upgrade
apt-get -y dist-upgrade
apt-get install -y software-properties-common build-essential python-software-properties
apt-get autoclean
apt-get autoremove --purge
hostnamectl set-hostname domain.tld
echo "123.456.789.10 domain.tld" >> /etc/hosts
dpkg-reconfigure tzdata
```

### NGINX

Utilize os comandos abaixo para instalar o **NGINX** no servidor:

```bash
echo -e "deb http://nginx.org/packages/mainline/ubuntu/ $(lsb_release -cs) nginx \ndeb-src http://nginx.org/packages/mainline/ubuntu/ $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list
cd /tmp/ && wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key && rm nginx_signing.key
apt-get update && apt-get purge nginx && apt-get purge nginx-*
apt-get install -y nginx
systemctl start nginx && systemctl enable nginx
```

### DNSMask (Local on macOS)

```bash
brew install dnsmasq --with-dnssec

sudo brew services start dnsmasq

[ -d /etc/resolver ] || sudo mkdir -v /etc/resolver
sudo tee /etc/resolver/local >/dev/null <<EOF
nameserver 127.0.0.1
EOF

cat > $(brew --prefix)/etc/dnsmasq.conf <<-EOF
listen-address=127.0.0.1

# Add domains which you want to force to an IP address here.
# The example below send any host in double-click.net to a local
# web-server.
address=/local/127.0.0.1

# By  default,  dnsmasq  will  send queries to any of the upstream
# servers it knows about and tries to favour servers to are  known
# to  be  up.  Uncommenting this forces dnsmasq to try each query
# with  each  server  strictly  in  the  order  they   appear   in
# /etc/resolv.conf
strict-order
EOF

# You can test Dnsmasq by sending it a DNS query using thedigutility. Pick a name ending intest and use dig to query your new DNS server:
#
# dig testing.testing.one.two.three.web @127.0.0.1

# You should get back a response something like:
#
# ;; ANSWER SECTION:
# testing.testing.one.two.three.test. 0 IN A       127.0.0.1

# Testing you new configuration is easy; just use ping check that you can now resolve some DNS names in your new top-level domain:
#
# Make sure you haven't broken your DNS.
# ping -c 1 www.google.com
# Check that .dev names work
# ping -c 1 this.is.a.test.test
# ping -c 1 iam.the.walrus.test

# You should see results that mention the IP address in your Dnsmasq configuration like this:
#
# PING iam.the.walrus.test (127.0.0.1): 56 data bytes

### Add local DNS to search order in System Preferences
# System Preferences > Network > Wi-Fi (or whatever you use) > Advanced... > DNS > add 127.0.0.1 to top of the list.

# Set up DNS resolver order
#
# networksetup -setdnsservers "Wi-Fi" 127.0.0.1
# networksetup -setdnsservers "Bluetooth PAN" 127.0.0.1
# networksetup -setdnsservers "Thunderbolt Ethernet" 127.0.0.1
# networksetup -setdnsservers "Thunderbolt Bridge" 127.0.0.1
```

### PHP 7.2 (Linux)

```bash
apt-get update && apt-get purge php5-* && apt-get --purge autoremove -y && apt-get autoremove --purge php5-*
apt-get install -y software-properties-common build-essential
apt-get install -y python-software-properties
add-apt-repository -y ppa:ondrej/php
apt-get update -y
apt-cache pkgnames | grep php7.2
apt-cache search --names-only ^php7.2
apt-cache search ^php7.2
apt install
apt purge php7.1*
apt-get install -y php7.2 \
php7.2-dev \
php-pear \
php7.2-common \
php7.2-curl \
php7.2-fpm \
php7.2-cli \
php7.2-gd \
php7.2-opcache \
php7.2-intl \
php7.2-json \
php7.2-mysql \
php7.2-mbstring \
php7.2-sqlite3 \
php7.2-xml \
php7.2-zip \
php-redis

pecl install xdebug # or apt-get install php-xdebug
# sudo tee /etc/php/7.2/mods-available/xdebug.ini >/dev/null <<EOF
# extension="xdebug.so"
# EOF

echo "extension=xdebug.so" | tee -a /etc/php/7.2/mods-available/xdebug.ini

# ln -s /etc/php/7.2/mods-available/xdebug.ini /etc/php/7.2/cli/conf.d/20-xdebug.ini
# ln -s /etc/php/7.2/mods-available/xdebug.ini /etc/php/7.2/fpm/conf.d/20-xdebug.ini
```

### Composer

```bash
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer install --no-interaction --no-dev --prefer-dist
```

```
composer global config bin-dir --absolute
```

### MySQL

```bash
cd /tmp && wget http://repo.mysql.com/mysql-apt-config_0.8.9-1_all.deb
dpkg -i mysql-apt-config_0.8.9-1_all.deb
rm mysql-apt-config_0.8.9-1_all.deb
apt-get update
apt-get install -y mysql-server
mysql_secure_installation

# (VALIDATE PASSWORD) Press y|Y for Yes, any other key for No: [n]
# Change the password for root ? [n]
# Remove anonymous users? [y]
# Disallow root login remotely? [y]
# Remove test database and access to it? [y]
# Reload privilege tables now? [y]
```

*Ordem de prioridade de configuração do arquivo do MySQL:*
|     **File Name**     |                       **Purpose**                       |
|:---------------------:|:-------------------------------------------------------:|
| `/etc/my.cnf`         | *Global options*                                        |
| `/etc/mysql/my.cnf`   | *Global options*                                        |
| `SYSCONFDIR/my.cnf`   | *Global options*                                        |
| `$MYSQL_HOME/my.cnf`  | *Server-specific options (server only)*                 |
| `defaults-extra-file` | *The file specified with --defaults-extra-file, if any* |
| `~/.my.cnf`           | *User-specific options*                                 |
| `~/.mylogin.cnf`      | *User-specific login path options (clients only)*       |

### Node.js

```bash
cd /tmp && curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
apt-get install build-essential
apt-get install nodejs
```

**PM2**

```bash
npm install pm2 -g
pm2 startup -u root
pm2 delete all
pm2 list
pm2 start redis.js --name "Server Redis" --watch
pm2 save
pm2 dump && pm2 kill && pm2 resurrect
```

### Redis(Ubuntu)

```bash
echo -e ' deb http://packages.dotdeb.org squeeze all \n deb-src http://packages.dotdeb.org squeeze all' | tee /etc/apt/sources.list.d/redis.list
apt-get update && cd /tmp && wget http://www.dotdeb.org/dotdeb.gpg && cat dotdeb.gpg | apt-key add -
rm -f dotdeb.gpg
add-apt-repository ppa:chris-lea/redis-server -y
apt-get update
apt-get install -y build-essential tcl
apt-get install -y redis-server
service redis-server status
update-rc.d redis-server enable
```

### MongoDB

#### Setting Up the Server

```bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | tee /etc/apt/sources.list.d/mongodb-3.6.list
apt-get update -y
apt-get install -y mongodb-org
systemctl start mongod && systemctl enable mongod
```

#### Securing MongoDB

**Adding an Administrative User**

```bash
> mongo
> use admin
> db.createUser(
>    {
>        user: "AdminSammy",
>        pwd: "AdminSammy'sSecurePassword",
>        roles: [{ role: "root", db: "admin" }]
>    })
```

**Enabling Authentication**

Opening the configuration file:
```bash
sudo nano /etc/mongod.conf
```

Adding the following settings:
```bash
. . .
security:
    authorization: "enabled"
. . .
```

Restart the daemon:
```bash
sudo systemctl restart mongod
```

**Verifying the Administrative User's Access**

```bash
mongo -u AdminSammy -p --authenticationDatabase admin
```

#### Configuring Remote Access

**Enabling UFW**

```bash
sudo ufw status
sudo ufw enable
sudo ufw allow OpenSSH
```

**Allow access to mongoDB port for given IP**

```bash
sudo ufw allow from IP_of_Client to any port 27017
sudo ufw status
```

**Configuring a Public bindIP**

```bash
sudo nano /etc/mongod.conf
```

```bash
. . .
net:
    port: 27017
    bindIp: 127.0.0.1,IP_of_Client
. . .
```

**Restart the daemon**

```bash
systemctl restart mongod
systemctl status mongod
```

**Testing the Remote Connection**

```bash
mongo -u AdminSammy -p --authenticationDatabase admin --host IP_of_Client --port 27017
```

### Docker

Para melhor orientação sobre como instalar o Docker no LINUX o melhor conteúdo sobre se encontra na própria página do docker(https://docs.docker.com/install/linux/docker-ce/ubuntu/).

**Alguns comandos básicos do Docker**

_Informações do Docker:_

```bash
docker info ou docker version
```

_Listar todas as imagens disponíveis no seu repositório local(máquina em que o Docker está instalado):_

```bash
docker images
```

_Baixar uma imagem de um servidor DOCKER:_

```bash
docker pull [nome-da-image:tag?]
```

_Verificar o estado dos contêineres em execução:_

```bash
docker ps
```

_Para STOP determinado container:_

```bash
docker stop <id-ou-nome-container>
```

_Para START determinado container:_

```bash
docker start <id-ou-nome-container>
```

_Para entrar dentro de um container:_

```
docker exec -it <id-ou-nome-container> bash
```

## License

[MIT License](https://github.com/AllysonSilva/environment/blob/master/LICENSE)
