echo "Link config"

CONFIG_FILE="${HOME}/.config/ghostty/config"
CONFIG_BKP_FILE="${HOME}/.config/ghostty/config.bkp"

# if ${CONFIG_FILE} is a file and not a link
if [ -f "${CONFIG_FILE}" ] && [ ! -L "${CONFIG_FILE}" ]; then
    echo "Copy existing config to ${CONFIG_BKP_FILE}"
    rm -rf "${CONFIG_BKP_FILE}"
    cp -f "${CONFIG_FILE}" "${CONFIG_BKP_FILE}"
fi

rm -rf "${CONFIG_FILE}"
ln -s -f "$(realpath ghostty/config)" "${CONFIG_FILE}"
