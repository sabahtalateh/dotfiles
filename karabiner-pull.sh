CONFIG_FILE="${HOME}/.config/karabiner/karabiner.json"

if [ ! -e "${CONFIG_FILE}" ]; then
    echo "No existing karabiner config found. Skip step"
else
    echo "Copy existing karabiner config"
    cp "${CONFIG_FILE}" karabiner/karabiner.json
fi
