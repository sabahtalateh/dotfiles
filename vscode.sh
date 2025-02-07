if ! command -v code 2>&1 >/dev/null
then
    echo "VSCode not installed"
    exit 1
fi

echo "Copy VSCode settings.json"
cp vscode/settings.json "${HOME}/Library/Application Support/Code/User/settings.json"

echo "Copy VSCode snippets"
mkdir "${HOME}/Library/Application Support/Code/User/snippets" 2> /dev/null
cp vscode/snippets/go.json "${HOME}/Library/Application Support/Code/User/snippets/go.json"

echo "Install VSCode extensions"
cat vscode/extensions.txt | xargs -L 1 code --force --install-extension
