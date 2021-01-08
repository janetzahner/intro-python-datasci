set -e

if [ ! -d ".git" ]; then
    echo "Error: no .git directory detected"
    echo "This script should be run from the base of the repo"
    echo 'e.g. `bash scripts/test_nb_scripts.sh`'
    exit 1
fi

# Match all notebook files with content.
failures=0
cd nb_scripts
for file in *.py; do
    # Run the file and increment the failures if it fails
    python $file || ((failures=failures+1))
done

if [ "$failures" -gt "0" ]; then
    >&2 echo "$failures failures"
fi

exit $failures
