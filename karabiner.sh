CONFIG_FILE="${HOME}/.config/karabiner/karabiner.json"

echo "Copy karabiner config"
if [ -e "${CONFIG_FILE}" ]; then
    echo "Copy existing config to ${SETTINGS_BKP_FILE}"
    cp "${CONFIG_FILE}" "${CONFIG_FILE_BKP}"
fi
cp karabiner/karabiner.json "${CONFIG_FILE}"
