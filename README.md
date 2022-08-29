# My Environment ⚡️

> **Instruções e configurações sobre diversos assuntos de desenvolvimento de software**

## [Hyper.js - 3.1.1](https://hyper.is)

![Screenshot](HyperJS/screenshot.png)

### Plugins

- [**hyperborder**](https://github.com/webmatze/hyperborder)
- [**hyper-tabs-enhanced**](https://github.com/henrikdahl/hyper-tabs-enhanced)
- [**gitrocket**](https://www.npmjs.com/package/gitrocket)
- [**space-pull**](https://www.npmjs.com/package/space-pull)
- [**hyper-pane**](https://github.com/chabou/hyper-pane)
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

## License

[MIT License](https://github.com/AllysonSilva/environment/blob/master/LICENSE)
