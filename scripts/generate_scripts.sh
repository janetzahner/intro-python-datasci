set -e

if [ ! -d ".git" ]; then
    echo "Error: no .git directory detected"
    echo "This script should be run from the base of the repo"
    echo 'e.g. `bash scripts/generate_scripts.sh`'
    exit 1
fi

mkdir -p nb_scripts
# Match all notebook files with content.
for file in notebooks/*-*.ipynb; do
    jupyter nbconvert --to python $file --output-dir=nb_scripts/
done
