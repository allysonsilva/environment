# Extensões Visual Studio Code Insiders

> Para ver informações da extensão pesquise em: <br> **https://marketplace.visualstudio.com/items?itemName=[_extension_name_]** <br>

### Extensões

- *vscode-icons-team.vscode-icons*
- *muhammadsammy.flat-ui-dark*
- *octref.vetur*
- *bmewburn.vscode-intelephense-client*
- *ms-azuretools.vscode-docker*

**_Utilize o script abaixo para instalar as extensões._**

```bash
extensions=( "vscode-icons-team.vscode-icons" \
"muhammadsammy.flat-ui-dark" \
"octref.vetur" \
"bmewburn.vscode-intelephense-client" \
"ms-azuretools.vscode-docker" )
for extension in ${extensions[@]}
do
    echo;
    /Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code --install-extension $extension
done
```
