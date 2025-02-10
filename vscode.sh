if ! command -v code 2>&1 >/dev/null
then
    echo "VSCode not installed"
    exit 1
fi

SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"
SETTINGS_FILE="${SETTINGS_DIR}/settings.json"

ln -s $(realpath vscode/settings.json) "${SETTINGS_FILE}"

# SETTINGS_BKP_FILE="${SETTINGS_DIR}/settings.json.bkp"
# KEYBINDINGS_FILE="${SETTINGS_DIR}/keybindings.json"
# KEYBINDINGS_BKP_FILE="${SETTINGS_DIR}/keybindings.json.bkp"

# echo "Copy VSCode settings"
# if [ -e "${SETTINGS_FILE}" ]; then
#     echo "Copy existing settings to ${SETTINGS_BKP_FILE}"
#     cp "${SETTINGS_FILE}" "${SETTINGS_BKP_FILE}"
# fi
# cp vscode/settings.json "${SETTINGS_FILE}"

# echo "Copy VSCode keybindings"
# if [ -e "${KEYBINDINGS_FILE}" ]; then
#     echo "Copy existing settings to ${KEYBINDINGS_BKP_FILE}"
#     cp "${KEYBINDINGS_FILE}" "${KEYBINDINGS_BKP_FILE}"
# fi
# cp vscode/keybindings.json "${KEYBINDINGS_FILE}"

# echo "Copy VSCode snippets"
# mkdir -p "${SNIPPETS_DIR}" 2> /dev/null
# cp -r vscode/snippets/. "${SETTINGS_DIR}/snippets/"

# echo "Install VSCode extensions"
# cat vscode/extensions.txt | xargs -L 1 code --force --install-extension
