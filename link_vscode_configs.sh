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

# if ${SETTINGS_FILE} is a file and not a link
if [ -f "${SETTINGS_FILE}" ] && [ ! -L "${SETTINGS_FILE}" ]; then
    echo "Copy existing settings.json to ${SETTINGS_BKP_FILE}"
    rm -rf "${SETTINGS_BKP_FILE}"
    cp -f "${SETTINGS_FILE}" "${SETTINGS_BKP_FILE}"
fi

rm -rf "${SETTINGS_FILE}"
ln -sf $(realpath vscode/settings.json) "${SETTINGS_FILE}"


### Link keybinding

echo "Link keybindings.json"

# if ${KEYBINDINGS_FILE} is a file and not a link
if [ -f "${KEYBINDINGS_FILE}" ] && [ ! -L "${KEYBINDINGS_FILE}" ]; then
    echo "Copy existing keybindings.json to ${KEYBINDINGS_BKP_FILE}"
    rm -rf "${KEYBINDINGS_BKP_FILE}"
    cp -f "${KEYBINDINGS_FILE}" "${KEYBINDINGS_BKP_FILE}"
fi

rm -rf "${KEYBINDINGS_FILE}"
ln -s -f $(realpath vscode/keybindings.json) "${KEYBINDINGS_FILE}"


### Link snippets

echo "Link snippets"

# if ${KEYBINDINGS_FILE} is a directory and not a link
if [ -d "${SNIPPETS_DIR}" ] && [ ! -L "${SNIPPETS_DIR}" ]; then
    echo "Copy existing snippets to ${SNIPPETS_DIR_BKP}"
    rm -rf "${SNIPPETS_DIR_BKP}"
    cp -rf "${SNIPPETS_DIR}" "${SNIPPETS_DIR_BKP}"
fi

rm -rf "${SNIPPETS_DIR}"
ln -s -f $(realpath vscode/snippets) "${SNIPPETS_DIR}"


### Install extensions

echo "Install VSCode extensions"
cat vscode/extensions.txt | xargs -L 1 code --force --install-extension
