#!/usr/bin/env bash
# generate_submission.sh — Package hw3 artefacts into a submission zip.
#
# Expected layout before running:
#   afl-assignment/afl-training/quickstart/out[/default]/
#   afl-assignment/afl-training/harness/harness.c
#   afl-assignment/afl-training/harness/in/
#   afl-assignment/afl-training/harness/out[/default]/
#   afl-assignment/afl-training/challenges/heartbleed/in/
#   afl-assignment/afl-training/challenges/heartbleed/out[/default]/
#
# Usage:
#   ./generate_submission.sh [output_name.zip]
#
# If no name is supplied the zip is written to submission.zip.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

ZIP_FILENAME="${1:-submission.zip}"
STAGING_DIR="submission_tmp"

TASK1_BASE="afl-assignment/afl-training/quickstart"
TASK2_BASE="afl-assignment/afl-training/harness"
TASK3_BASE="afl-assignment/afl-training/challenges/heartbleed"

require_path() {
    local path="$1"
    local label="$2"
    if [[ ! -e "${path}" ]]; then
        echo "ERROR: Missing required artefact for ${label}: ${path}"
        echo "       Please generate it before running this script."
        exit 1
    fi
}

pick_afl_out_dir() {
    local base_dir="$1"
    local label="$2"
    local default_out="${base_dir}/out/default"
    local plain_out="${base_dir}/out"

    if [[ -f "${default_out}/fuzzer_stats" ]]; then
        printf '%s\n' "${default_out}"
        return 0
    fi

    if [[ -f "${plain_out}/fuzzer_stats" ]]; then
        printf '%s\n' "${plain_out}"
        return 0
    fi

    echo "ERROR: Missing required artefact for ${label}: fuzzer_stats"
    echo "       Looked for:"
    echo "         ${default_out}/fuzzer_stats"
    echo "         ${plain_out}/fuzzer_stats"
    exit 1
}

echo "Checking required artefacts..."

TASK1_OUT_DIR="$(pick_afl_out_dir "${TASK1_BASE}" "Task 1")"
require_path "${TASK1_OUT_DIR}/crashes" "Task 1 — crashes/"

require_path "${TASK2_BASE}/harness.c" "Task 2 — harness.c"
require_path "${TASK2_BASE}/in" "Task 2 — in/"
TASK2_OUT_DIR="$(pick_afl_out_dir "${TASK2_BASE}" "Task 2")"
require_path "${TASK2_OUT_DIR}/crashes" "Task 2 — crashes/"

require_path "${TASK3_BASE}/in" "Task 3 — in/"
TASK3_OUT_DIR="$(pick_afl_out_dir "${TASK3_BASE}" "Task 3")"
require_path "${TASK3_OUT_DIR}/crashes" "Task 3 — crashes/"

if [[ ! -f "identifier.txt" ]]; then
    echo "WARNING: identifier.txt not found in hw3/."
    echo "         Create it with the format:  <student_id>, <First Last>"
    echo "         It will be omitted from the zip if missing."
fi

echo "All required artefacts found."

echo "Building staging directory: ${STAGING_DIR}/"
rm -rf "${STAGING_DIR}"

mkdir -p \
    "${STAGING_DIR}/task1" \
    "${STAGING_DIR}/task2" \
    "${STAGING_DIR}/task3"

cp "${TASK1_OUT_DIR}/fuzzer_stats" "${STAGING_DIR}/task1/"
cp -r "${TASK1_OUT_DIR}/crashes" "${STAGING_DIR}/task1/"

cp "${TASK2_BASE}/harness.c" "${STAGING_DIR}/task2/"
cp -r "${TASK2_BASE}/in" "${STAGING_DIR}/task2/"
cp "${TASK2_OUT_DIR}/fuzzer_stats" "${STAGING_DIR}/task2/"
cp -r "${TASK2_OUT_DIR}/crashes" "${STAGING_DIR}/task2/"

cp -r "${TASK3_BASE}/in" "${STAGING_DIR}/task3/"
cp "${TASK3_OUT_DIR}/fuzzer_stats" "${STAGING_DIR}/task3/"
cp -r "${TASK3_OUT_DIR}/crashes" "${STAGING_DIR}/task3/"

if [[ -f "identifier.txt" ]]; then
    cp "identifier.txt" "${STAGING_DIR}/"
fi

rm -f "${ZIP_FILENAME}"
echo "Creating ${ZIP_FILENAME}..."
(cd "${STAGING_DIR}" && zip -r "../${ZIP_FILENAME}" .)

rm -rf "${STAGING_DIR}"

echo ""
echo "Done! Submission archive: ${SCRIPT_DIR}/${ZIP_FILENAME}"
echo ""
echo "Contents:"
zip -sf "${ZIP_FILENAME}" | sed 's/^/  /'
