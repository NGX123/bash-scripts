# Install vscode extensions
# Format author.extension(this info is displayed next to extension name on it's store page)
code --install-extension aaronthomas.vscode-snazzy-operator
code --install-extension ms-vscode.cpptools
code --install-extension ms-python.python

read -p "Platform: " platform_var
vscode_config=./textfiles/vscode-config.json

if [ $platform_var == macos ]
then
	cat "$vscode_config" > $HOME/Library/ApplicationSupport/Code/User/settings.json
fi

if [ $platform_var == linux ]
then
	cat "$vscode_config" > $HOME/.config/Code/User/settings.json
fi

# Configuration articles
    # https://dev.to/iamismile/my-vs-code-setup-4fcd
    # https://code.visualstudio.com/docs/editor/command-line
    # https://calebporzio.com/my-vs-code-setup-2
    # https://code.visualstudio.com/docs/getstarted/settings
