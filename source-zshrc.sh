ZSHRC_FILE="${HOME}/.zshrc"
SOURCE_FILE="\${HOME}/.dotfiles/zsh/zshrc"
SOURCE_STRING="source ${SOURCE_FILE}"

if grep -q "${SOURCE_STRING}" "${ZSHRC_FILE}"; then
    echo "${SOURCE_FILE} already sourced within ${ZSHRC_FILE}"
else
    echo "Add ${SOURCE_FILE} sourcing to ${ZSHRC_FILE}"

    echo "\n" >> "${ZSHRC_FILE}"
    echo "# Added from \${HOME}/.dotfiles/zshrc.sh" >> "${ZSHRC_FILE}"
    echo "${SOURCE_STRING}" >> "${ZSHRC_FILE}"

    echo "To take effect restart terminal or execute: source ${HOME}/.zshrc"
fi
