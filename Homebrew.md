# Homebrew

## Comandos

**Mostra todos as fórmulas e quem(qual fórmula) está utilizando como sua dependência**

```bash
brew list | while read cask; do echo -ne "\x1B[1;34m $cask \x1B[0m"; brew uses $cask --installed | awk '{printf(" %s ", $0)}'; echo ""; done
```

Alguns exemplos ao executar o comando:

```
autoconf automake
icu4c php node
```

Então:

- `automake` tem `autoconf` como sua dependência.
- `php` e `node` tem `icu4c` como sua dependência.

**Lista todas as fórmulas que tem `[FORMULA]` como sua dependência `Required`**

```bash
brew uses --installed --skip-recommended [FORMULA]
```

*Veja o exemplo abaixo que mostra algumas fórmulas que tem `openssl` como sua dependência. Tem o parâmetro da fórmula [**Required:**] como sendo um dos seus itens `openssl`.*

```bash
brew uses --installed openssl

# php
# mysql
# nginx
# mongodb
# python3
```

**Lista todas as dependências de primeiro nível em formato de `tree` para determinada fórmula**

```bash
brew deps --tree --1 --skip-recommended [FORMULA]
```

*Adicionando `--installed` mostra as dependências para cada fórmula instalada.*

**Lista todas as fórmulas e suas dependências**

```bash
brew list | while read cask; do echo -n "\e[1;34m$cask ->\e[0m"; brew deps $cask --1 --skip-recommended | awk '{printf(" %s ", $0)}'; echo ""; done
```

**Remover todas as dependências de determinada fórmula**

```bash
brew deps --include-optional [FORMULA] | xargs brew remove --ignore-dependencies
```

**Remove determinada fórmula ignorando suas dependências**

```bash
brew remove --force --ignore-dependencies [FORMULA]
```

**Verifica fórmula para checagem do estilo de codificação _Homebrew_**

*Isso deve ser executado quando tiver editando(`brew edit`) uma fórmula ou antes de pedir um PR.*

```bash
brew audit --strict --online [FORMULA]
```

## Desenvolvimento Local

```bash
xcode-select -p
xcode-select --install
brew install pkg-config autoconf automake
brew install openssl
ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/
brew install ruby
brew install python python@2
pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools
brew install openssh
brew install openssl@1.1
brew tap homebrew/services
brew install git
brew install diff-so-fancy
brew install httpie
brew install wget
brew install vim
brew install curl curl-openssl
brew install libssh2 icu4c libev libevent libyaml libxml2
brew install tree pv exa fd fzf jq vegeta wrk siege ack ag ripgrep lz4
brew install php
pecl install igbinary lzf ds
yes | pecl install redis
brew install rabbitmq
brew install rabbitmq-c
pecl install amqp
pecl install mongodb
pecl install swoole
pecl install xdebug
brew install node
brew install yarn
brew install kubernetes-cli kubernetes-helm
brew install redis
brew install mongodb
brew install nginx
brew install dnsmasq
brew install mysql@5.7
brew install gnu-sed
brew install go

brew services start redis
brew services start rabbitmq
brew services start php
brew services start mongodb
brew services start nginx
sudo brew services start dnsmasq
brew services start mysql@5.7
```
