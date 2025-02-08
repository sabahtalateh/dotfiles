if ! command -v code 2>&1 >/dev/null
then
    echo "VSCode not installed"
    exit 1
fi

SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"
SETTINGS_FILE="${SETTINGS_DIR}/settings.json"
SNIPPETS_DIR="${SETTINGS_DIR}/snippets"

if [ ! -e "${SETTINGS_FILE}" ]; then
    echo "No existing VSCode settings found. Skip step"
else
    echo "Copy existing VSCode settings"
    cp "${SETTINGS_FILE}" vscode/settings.json
fi

if [ ! -d "${SNIPPETS_DIR}" ]; then 
    echo "No existing VSCode snippets found. Skip step"
else
    echo "Copy existing VSCode snippets"
    cp -r "${SNIPPETS_DIR}/." vscode/snippets/
fi

