#/usr/bin/env bash
jekyll build .
pushd _site
python -m SimpleHTTPServer &
SERVEPID="$!"
popd
trap  "kill ${SERVEPID}" SIGINT
watch -n 3 jekyll build .

