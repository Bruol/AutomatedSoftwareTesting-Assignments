#!/usr/bin/env bash
# generate_submission.sh — Package hw2 artefacts into a submission zip.
#
# Expected layout before running:
#   task1/klee-out-0/
#   task2/maze.c  task2/klee-out-0/
#   task3/binary_search.c  task3/klee-out-0/  task3/klee-out-1/
#   task4/klee-out-0/  task4/klee-out-1/  task4/klee-out-2/
#
# Usage:
#   ./generate_submission.sh [output_name.zip]
#
# If no name is supplied the zip is written to  submission.zip.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

ZIP_FILENAME="${1:-submission.zip}"
STAGING_DIR="submission_tmp"

# ---------------------------------------------------------------------------
# Helper: check a path exists, print a readable error and exit if not
# ---------------------------------------------------------------------------
require() {
    local path="$1"
    local label="$2"
    if [[ ! -e "${path}" ]]; then
        echo "ERROR: Missing required artefact for ${label}: ${path}"
        echo "       Please generate it before running this script."
        exit 1
    fi
}

# ---------------------------------------------------------------------------
# Validate all required artefacts
# ---------------------------------------------------------------------------
echo "Checking required artefacts..."

require "task1/klee-out-0"         "Task 1 — klee-out-0"
require "task2/maze.c"             "Task 2 — maze.c"
require "task2/klee-out-0"         "Task 2 — klee-out-0"
require "task3/binary_search.c"    "Task 3 — binary_search.c"
require "task3/klee-out-0"         "Task 3 — klee-out-0 (bug-triggering)"
require "task3/klee-out-1"         "Task 3 — klee-out-1 (fixed, 11 test cases)"
require "task4/klee-out-0"         "Task 4 — klee-out-0 (-sym-args)"
require "task4/klee-out-1"         "Task 4 — klee-out-1 (-sym-stdin)"
require "task4/klee-out-2"         "Task 4 — klee-out-2 (-sym-files)"

# Optional but strongly recommended
if [[ ! -f "identifier.txt" ]]; then
    echo "WARNING: identifier.txt not found in hw2/."
    echo "         Create it with the format:  <student_id>, <First Last>"
    echo "         It will be omitted from the zip if missing."
fi

echo "All required artefacts found."

# ---------------------------------------------------------------------------
# Build staging directory
# ---------------------------------------------------------------------------
echo "Building staging directory: ${STAGING_DIR}/"
rm -rf "${STAGING_DIR}"

mkdir -p \
    "${STAGING_DIR}/task1" \
    "${STAGING_DIR}/task2" \
    "${STAGING_DIR}/task3" \
    "${STAGING_DIR}/task4"

# Task 1
cp -r "task1/klee-out-0" "${STAGING_DIR}/task1/"

# Task 2
cp "task2/maze.c" "${STAGING_DIR}/task2/"
cp -r "task2/klee-out-0" "${STAGING_DIR}/task2/"

# Task 3
cp "task3/binary_search.c" "${STAGING_DIR}/task3/"
cp -r "task3/klee-out-0" "${STAGING_DIR}/task3/"
cp -r "task3/klee-out-1" "${STAGING_DIR}/task3/"

# Task 4
cp -r "task4/klee-out-0" "${STAGING_DIR}/task4/"
cp -r "task4/klee-out-1" "${STAGING_DIR}/task4/"
cp -r "task4/klee-out-2" "${STAGING_DIR}/task4/"

# identifier.txt (optional)
if [[ -f "identifier.txt" ]]; then
    cp "identifier.txt" "${STAGING_DIR}/"
fi

# ---------------------------------------------------------------------------
# Create zip
# ---------------------------------------------------------------------------
rm -f "${ZIP_FILENAME}"
echo "Creating ${ZIP_FILENAME}..."
(cd "${STAGING_DIR}" && zip -r "../${ZIP_FILENAME}" .)

rm -rf "${STAGING_DIR}"

echo ""
echo "Done! Submission archive: ${SCRIPT_DIR}/${ZIP_FILENAME}"
echo ""
echo "Contents:"
zip -sf "${ZIP_FILENAME}" | sed 's/^/  /'
