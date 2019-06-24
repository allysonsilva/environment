# Extensões Visual Studio Code

> Para ver informações da extensão pesquise em: <br> **https://marketplace.visualstudio.com/items?itemName=[_extension_name_]** <br>

### Extensões

- *aaron-bond.better-comments*
- *CoenraadS.bracket-pair-colorizer*
- *daylerees.rainglow*
- *esbenp.prettier-vscode*
- *bmewburn.vscode-intelephense-client*
- *felixfbecker.php-debug*
- *MehediDracula.php-namespace-resolver*
- *monokai.theme-monokai-pro-vscode*
- *ms-azuretools.vscode-docker*
- *ms-vscode.csharp*
- *neilbrayfield.php-docblocker*
- *octref.vetur*
- *onecentlin.laravel-blade*
- *onecentlin.laravel5-snippets*
- *PKief.material-icon-theme*
- *ryannaddy.laravel-artisan*
- *vscode-icons-team.vscode-icons*
- *wayou.vscode-todo-highlight*
- *yzhang.markdown-all-in-one*

----------

**Utilize o script abaixo para instalar as extensões via comando [code](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line) do VS Code.**

```bash
#!/bin/sh
if test "$(which code)"; then

    if [ "$(uname -s)" = "Darwin" ]; then
        VSCODE_USER="$HOME/Library/Application Support/Code"
    else
        VSCODE_USER="$HOME/.config/Code"
    fi

    DOTFILES="$HOME/Development/GitHub/Environment"

    ln -sf "$DOTFILES/Visual Studio Code/settings.json" "$VSCODE_USER/User/settings.json"
    ln -sf "$DOTFILES/Visual Studio Code/keybindings.json" "$VSCODE_USER/User/keybindings.json"

    rm -rf "$VSCODE_USER/User/snippets" && \
    ln -sfn "$DOTFILES/Visual Studio Code/snippets" "$VSCODE_USER/User"

    # From `code --list-extensions`
    extensions=( "aaron-bond.better-comments" \
    "CoenraadS.bracket-pair-colorizer" \
    "daylerees.rainglow" \
    "esbenp.prettier-vscode" \
    "bmewburn.vscode-intelephense-client" \
    "felixfbecker.php-debug" \
    "MehediDracula.php-namespace-resolver" \
    "monokai.theme-monokai-pro-vscode" \
    "ms-azuretools.vscode-docker" \
    "ms-vscode.csharp" \
    "neilbrayfield.php-docblocker" \
    "octref.vetur" \
    "onecentlin.laravel-blade" \
    "onecentlin.laravel5-snippets" \
    "PKief.material-icon-theme" \
    "ryannaddy.laravel-artisan" \
    "vscode-icons-team.vscode-icons" \
    "wayou.vscode-todo-highlight" \
    "yzhang.markdown-all-in-one" )
    for extension in ${extensions[@]}
    do
        echo;
        code --install-extension $extension || true
    done
fi
```
