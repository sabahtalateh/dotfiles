if ! command -v code 2>&1 >/dev/null
then
    echo "VSCode not installed"
    exit 1
fi

SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"
SETTINGS_FILE="${SETTINGS_DIR}/settings.json"
SETTINGS_BKP_FILE="${SETTINGS_DIR}/settings.json.bkp"
SNIPPETS_DIR="${SETTINGS_DIR}/snippets"

echo "Link VSCode settings.json"
if [ -e "${SETTINGS_FILE}" ]; then
    echo "Copy existing settings to ${SETTINGS_BKP_FILE}"
    cp "${SETTINGS_FILE}" "${SETTINGS_BKP_FILE}"
fi

echo "Copy settings.json"
cp vscode/settings.json "${SETTINGS_FILE}"

echo "Copy VSCode snippets"
mkdir "${SNIPPETS_DIR}" 2> /dev/null
cp -r vscode/snippets/* "${SNIPPETS_DIR}"

echo "Install VSCode extensions"
cat vscode/extensions.txt | xargs -L 1 code --force --install-extension
