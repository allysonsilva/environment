# Homebrew

## Comandos

**Mostra todos as fórmulas e quem(qual fórmula) está utilizando como sua dependência**

```bash
brew list | while read cask; do echo -ne "\x1B[1;34m $cask \x1B[0m"; brew uses $cask --installed | awk '{printf(" %s ", $0)}'; echo ""; done
```

Alguns exemplos ao executar o comando:

```
autoconf automake
icu4c php72 node
php72 php72-opcache php72-xdebug
```

Então:

- `automake` tem `autoconf` como sua dependência.
- `php72` e `node` tem `icu4c` como sua dependência.
- `php72-opcache` e `php72-xdebug` tem `php72` como sua dependência.

**Lista todas as fórmulas que tem `[FORMULA]` como sua dependência `Required`**

```bash
brew uses --installed --skip-recommended [FORMULA]
```

*Veja o exemplo abaixo que mostra algumas fórmulas que tem `openssl` como sua dependência. Tem o parâmetro da fórmula [**Required:**] como sendo um dos seus itens `openssl`.*

```bash
brew uses --installed openssl

# php72
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
