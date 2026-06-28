#!/usr/bin/env bash
set -euo pipefail

if [ ! -d "/Applications/Karabiner-Elements.app" ]; then
    echo "Karabiner-Elements not installed"
    exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
    echo "jq not installed (brew install jq)"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RULES_DIR="${SCRIPT_DIR}/karabiner"

CONFIG_DIR="${HOME}/.config/karabiner"
CONFIG_FILE="${CONFIG_DIR}/karabiner.json"
CONFIG_BKP_FILE="${CONFIG_DIR}/karabiner.json.bkp"

mkdir -p "${CONFIG_DIR}"

# Back up an existing config; otherwise start from a minimal profile
if [ -f "${CONFIG_FILE}" ]; then
    echo "Backup current config to ${CONFIG_BKP_FILE}"
    cp -f "${CONFIG_FILE}" "${CONFIG_BKP_FILE}"
else
    echo "No karabiner.json found, creating a minimal one"
    echo '{"profiles":[{"name":"Default profile","selected":true,"simple_modifications":[],"complex_modifications":{"rules":[]}}]}' > "${CONFIG_FILE}"
fi

# simple.json is already an array of {from,to}; the rest are individual complex rules
SIMPLE="$(jq '.' "${RULES_DIR}/simple.json")"
COMPLEX="$(cat $(ls "${RULES_DIR}"/*.json | grep -v '/simple.json') | jq -s '.')"

echo "Inject $(echo "${SIMPLE}" | jq 'length') simple and $(echo "${COMPLEX}" | jq 'length') complex modifications"

# Existing simple_modifications and complex_modifications.rules are replaced
TMP_FILE="$(mktemp)"
jq --argjson simple "${SIMPLE}" --argjson complex "${COMPLEX}" '
  (.profiles[] | select(.selected)) |= (
    .simple_modifications = $simple
    | .complex_modifications.rules = $complex
  )
' "${CONFIG_FILE}" > "${TMP_FILE}"

mv -f "${TMP_FILE}" "${CONFIG_FILE}"

echo "Done. Karabiner-Elements will reload the config automatically"
