if ! command -v lf 2>&1 >/dev/null
then
    echo "lf not installed"
    exit 1
fi

echo "Link lfrc"

LFRC_DIR="${HOME}/.config/lf"
LFRC_FILE="${LFRC_DIR}/lfrc"
LFRC_BKP_FILE="${LFRC_DIR}/lfrc.bkp"

# if ${LFRC_FILE} is a file and not a link
if [ -f "${LFRC_FILE}" ] && [ ! -L "${LFRC_FILE}" ]; then
    echo "Copy existing lfrc to ${LFRC_BKP_FILE}"
    rm -rf "${LFRC_BKP_FILE}"
    cp -f "${LFRC_FILE}" "${LFRC_BKP_FILE}"
fi

rm -rf "${LFRC_FILE}"
mkdir -p "${LFRC_DIR}"
ln -s -f "$(realpath lf/lfrc)" "${LFRC_FILE}"
