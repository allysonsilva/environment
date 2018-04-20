# Extensões Visual Studio Code

> Para ver informações da extensão pesquise em: <br> **https://marketplace.visualstudio.com/items?itemName=[_extension_name_]** <br>

### Extensões

- *CoenraadS.bracket-pair-colorizer*
- *Equinusocio.vsc-material-theme*
- *MehediDracula.php-namespace-resolver*
- *PKief.material-icon-theme*
- *aaron-bond.better-comments*
- *akamud.vscode-theme-onelight*
- *alefragnani.Bookmarks*
- *anoff.theme-monokai-light*
- *bmewburn.vscode-intelephense-client*
- *cjhowe7.laravel-blade*
- *dbaeumer.vscode-eslint*
- *esbenp.prettier-vscode*
- *felixfbecker.php-debug*
- *idleberg.icon-fonts*
- *joelday.docthis*
- *joshpeng.sublime-babel-vscode*
- *ms-vscode.csharp*
- *neilbrayfield.php-docblocker*
- *octref.vetur*
- *onecentlin.laravel5-snippets*
- *robertohuertasm.vscode-icons*
- *robinbentley.sass-indented*
- *ryannaddy.laravel-artisan*
- *tinkertrain.theme-panda*
- *vincaslt.highlight-matching-tag*
- *wayou.vscode-todo-highlight*
- *wix.vscode-import-cost*
- *yzhang.markdown-all-in-one*
- *zhuangtongfa.Material-theme*
- *wesbos.theme-cobalt2*
- *xyz.local-history*

----------

**Utilize o script abaixo para instalar todas as extensões via comando [code](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line) do VS Code.**

```bash
extensions=( "CoenraadS.bracket-pair-colorizer" \
"Equinusocio.vsc-material-theme" \
"MehediDracula.php-namespace-resolver" \
"PKief.material-icon-theme" \
"aaron-bond.better-comments" \
"akamud.vscode-theme-onelight" \
"alefragnani.Bookmarks" \
"anoff.theme-monokai-light" \
"bmewburn.vscode-intelephense-client" \
"cjhowe7.laravel-blade" \
"dbaeumer.vscode-eslint" \
"esbenp.prettier-vscode" \
"felixfbecker.php-debug" \
"idleberg.icon-fonts" \
"joelday.docthis" \
"joshpeng.sublime-babel-vscode" \
"ms-vscode.csharp" \
"neilbrayfield.php-docblocker" \
"octref.vetur" \
"onecentlin.laravel5-snippets" \
"robertohuertasm.vscode-icons" \
"robinbentley.sass-indented" \
"ryannaddy.laravel-artisan" \
"tinkertrain.theme-panda" \
"vincaslt.highlight-matching-tag" \
"wayou.vscode-todo-highlight" \
"wix.vscode-import-cost" \
"yzhang.markdown-all-in-one" \
"zhuangtongfa.Material-theme" \
"wesbos.theme-cobalt2" \
"xyz.local-history" \
"PeterJausovec.vscode-docker" )
for extension in ${extensions[@]}
do
    echo;
    code --install-extension $extension
done
```
