if ! command -v code 2>&1 >/dev/null
then
    echo "VSCode not installed"
    exit 1
fi

SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"
SETTINGS_FILE="${SETTINGS_DIR}/settings.json"
SETTINGS_BKP_FILE="${SETTINGS_DIR}/settings.json.bkp"
KEYBINDINGS_FILE="${SETTINGS_DIR}/keybindings.json"
KEYBINDINGS_BKP_FILE="${SETTINGS_DIR}/keybindings.json.bkp"
SNIPPETS_DIR="${SETTINGS_DIR}/snippets"
SNIPPETS_DIR_BKP="${SETTINGS_DIR}/snippets.bkp"

### Link settings

echo "Link settings.json"

if [ -L "${SETTINGS_FILE}" ]; then
    echo "Existing settings.json is a link. Removing it"
    rm "${SETTINGS_FILE}"
fi

if [ -e "${SETTINGS_FILE}" ]; then
    echo "Copy existing settings.json to ${SETTINGS_BKP_FILE}"
    rm "${SETTINGS_BKP_FILE}"
    cp "${SETTINGS_FILE}" "${SETTINGS_BKP_FILE}"
fi

ln -s -f $(realpath vscode/settings.json) "${SETTINGS_FILE}"

echo "settings.json linked"


### Link keybinding

echo "Link keybindings.json"

if [ -L "${KEYBINDINGS_FILE}" ]; then
    echo "Existing keybindings.json is a link. Removing it"
    rm "${KEYBINDINGS_FILE}"
fi

if [ -e "${KEYBINDINGS_FILE}" ]; then
    echo "Copy existing keybindings.json to ${KEYBINDINGS_BKP_FILE}"
    rm "${KEYBINDINGS_BKP_FILE}"
    cp "${KEYBINDINGS_FILE}" "${KEYBINDINGS_BKP_FILE}"
fi

ln -s -f $(realpath vscode/keybindings.json) "${KEYBINDINGS_FILE}"

echo "keybindings.json linked"


### Link snippets

echo "Link snippets"

if [ -L "${SNIPPETS_DIR}" ]; then
    echo "Existing snippets dir is a link. Removing it"
    rm "${SNIPPETS_DIR}"
fi

if [ -d "${SNIPPETS_DIR}" ]; then
    echo "Copy existing snippets to ${SNIPPETS_DIR_BKP}"
    rm -rf "${SNIPPETS_DIR_BKP}"
    cp -r "${SNIPPETS_DIR}" "${SNIPPETS_DIR_BKP}"
fi

ln -s -f $(realpath vscode/snippets) "${SNIPPETS_DIR}"

echo "snippets linked"


echo "Install VSCode extensions"
cat vscode/extensions.txt | xargs -L 1 code --force --install-extension
