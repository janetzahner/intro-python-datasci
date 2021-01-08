set -e

if [ ! -d ".git" ]; then
    echo "Error: no .git directory detected"
    echo "This script should be run from the base of the repo"
    echo 'e.g. `bash scripts/test_nb_scripts.sh`'
    exit 1
fi

# Match all notebook files with content.
for file in nb_scripts/*.py; do
    python $file
done
