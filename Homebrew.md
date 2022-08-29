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
brew uses --installed openssl@1.1

# php
# curl
# node
# python@3.9
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

### PHP 7.4 && 8.0

```bash
brew install php@8.0
brew install php@7.4

# Switch between PHP versions:
brew link --overwrite --force php@8.0
# OR
brew link --overwrite --force php@7.4

# If you get a warning like below, then do as recommended:
# Warning: Already linked: <Cellar Path>
brew unlink php@8.0
brew link --overwrite --force php@8.0
```

### Go

```bash
mkdir -p ~/.go
brew install go
```

### Composer

```bash
curl -sS https://getcomposer.org/installer | php -- --install-dir=/opt/homebrew/bin --filename=composer
composer install --no-interaction --no-dev --prefer-dist
```

### DNSMask

```bash
brew install dnsmasq --with-dnssec

sudo brew services start dnsmasq

[ -d /etc/resolver ] || sudo mkdir -v /etc/resolver
sudo tee /etc/resolver/local >/dev/null <<EOF
nameserver 127.0.0.1
EOF

cat > $(brew --prefix)/etc/dnsmasq.conf <<-EOF
# sudo tee /etc/resolver/local >/dev/null <<EOF
# nameserver 127.0.0.1
# EOF
address=/.local/127.0.0.1

# sudo tee /etc/resolver/localhost >/dev/null <<EOF
# nameserver 127.0.0.1
# EOF
address=/.localhost/127.0.0.1

# sudo tee /etc/resolver/develop >/dev/null <<EOF
# nameserver 127.0.0.1
# EOF
address=/.develop/127.0.0.1

# By  default,  dnsmasq  will  send queries to any of the upstream
# servers it knows about and tries to favour servers to are  known
# to  be  up.  Uncommenting this forces dnsmasq to try each query
# with  each  server  strictly  in  the  order  they   appear   in
# /etc/resolv.conf
strict-order

# listen only on localhost (for dnscrypt)
listen-address=127.0.0.1
# dnscrypt-proxy is on port 53:
server=127.0.0.1#53

# # The following directives prevent dnsmasq from forwarding plain names (without any dots)
# # or addresses in the non-routed address space to the parent nameservers.
# domain-needed
# bogus-priv

# default is 150, or 0 = off
cache-size=0

# # Logging
# log-dhcp
# log-queries

# fallback servers to use if we can't resolve using our own rules
# Cloudflare DNS Resolver
# server=1.1.1.1
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

sudo brew services restart dnsmasq
```

### `brew list`

```
argon2          fzf             krb5            libzip          perl           vim
aspell          gd              kubernetes-cli  lua             php            webp
autoconf        gdbm            libev           m4              php@7.4        wget
berkeley-db     gettext         libffi          make            pkg-config     xz
brotli          git             libidn2         moreutils       python@3.9     yarn
c-ares          glib            libpng          mpdecimal       readline       zsh
curl            gmp             libpq           ncurses         rtmpdump       zstd
diff-so-fancy   gnu-sed         libsodium       nghttp2         ruby
exa             go              libssh2         node            siege
fd              httpie          libtiff         oniguruma       sqlite
findutils       icu4c           libtool         openldap        tidy-html5
fontconfig      jemalloc        libunistring    openssl@1.1     tree
freetds         jpeg            libuv           pcre            unixodbc
freetype        jq              libyaml         pcre2           vegeta
```

### Others

```bash
############
# Gatekeeper
############
# - O Gatekeeper existe para evitar instalações de aplicativos não autorizados.
# - Impedi que aplicativos de terceiros sejam usados ​​no sistema.

# [Impedir o uso de aplicativos de terceiros não autorizados]
sudo spctl --master-enable
sudo spctl --master-disable
# [Permite o uso de aplicativos de terceiros]
sudo spctl --status
```

```bash
###############
# ZSH/Oh My Zsh
###############
brew install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change your default shell
chsh -s /opt/homebrew/bin/zsh

# Custom Plugins
git clone --depth=1 https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab
git clone --depth=1 https://github.com/skywind3000/z.lua ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/z.lua
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# External themes
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

```bash
# Unveil hidden macOS (OS X) features
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.dock mouse-over-hilite-stack -bool true
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock autohide -bool true
#
mkdir ${HOME}/Pictures/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true
```

```bash
ln -sfv ~/Development/GitHub/Environment/Git/.gitconfig ~/.gitconfig
ln -sfv ~/Development/GitHub/Environment/Git/.gitignore ~/.gitignore
ln -sfv ~/Development/GitHub/Environment/HyperJS/.hyper.js ~/.hyper.js
ln -sfv ~/Development/GitHub/Environment/Oh\ My\ Zsh/.* ~/
ln -sfv ~/Development/GitHub/Environment/Vim/.vimrc ~/.vimrc
ln -sfv ~/Development/GitHub/Environment/Visual\ Studio\ Code/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sfv ~/Development/GitHub/Environment/Visual\ Studio\ Code/snippets/* ~/Library/Application\ Support/Code/User/snippets/
```
