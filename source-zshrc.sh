ZSHRC_FILE="${HOME}/.zshrc"
SOURCE_STRING="source \${HOME}/.dotfiles/zsh/zshrc"

if grep -q "${SOURCE_STRING}" "${ZSHRC_FILE}"; then
    echo "\${HOME}/.dotfiles/zsh/zshrc already sourced"
else
    echo "Add \${HOME}/.dotfiles/zsh/zshrc sourcing to ${ZSHRC_FILE}"

    echo "\n" >> "${ZSHRC_FILE}"
    echo "# Added from ${HOME}/.dotfiles/zshrc.sh" >> "${ZSHRC_FILE}"
    echo "${SOURCE_STRING}" >> "${ZSHRC_FILE}"
fi

echo "To take effect restart terminal or execute: source ${HOME}/.zshrc"
