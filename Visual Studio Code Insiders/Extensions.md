# Extensões Visual Studio Code Insiders

> Para ver informações da extensão pesquise em: <br> **https://marketplace.visualstudio.com/items?itemName=[_extension_name_]** <br>

### Extensões

- *cjhowe7.laravel-blade*
- *dbaeumer.vscode-eslint*
- *esbenp.prettier-vscode*
- *joshpeng.sublime-babel-vscode*
- *joshpeng.theme-charcoal-oceanicnext*
- *octref.vetur*
- *robertohuertasm.vscode-icons*

**_Utilize o script abaixo para instalar todas as extensões._**

```bash
extensions=( "cjhowe7.laravel-blade" \
"dbaeumer.vscode-eslint" \
"esbenp.prettier-vscode" \
"joshpeng.sublime-babel-vscode" \
"joshpeng.theme-charcoal-oceanicnext" \
"octref.vetur" \
"robertohuertasm.vscode-icons" \
"PeterJausovec.vscode-docker" )
for extension in ${extensions[@]}
do
    echo;
    /Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code --install-extension $extension
done
```
