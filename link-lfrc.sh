if ! command -v lf 2>&1 >/dev/null
then
    echo "lf not installed"
    exit 1
fi

echo "Link lfrc"

LFRC_FILE="${HOME}/.config/lf/lfrc"
LFRC_BKP_FILE="${HOME}/.config/lf/lfrc.bkp"

# if ${LFRC_FILE} is a file and not a link
if [ -f "${LFRC_FILE}" ] && [ ! -L "${LFRC_FILE}" ]; then
    echo "Copy existing lfrc to ${LFRC_BKP_FILE}"
    rm -rf "${LFRC_BKP_FILE}"
    cp -f "${LFRC_FILE}" "${LFRC_BKP_FILE}"
fi

rm -rf "${LFRC_FILE}"
ln -s -f "$(realpath lf/lfrc)" "${LFRC_FILE}"
