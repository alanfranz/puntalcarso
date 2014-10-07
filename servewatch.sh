#/usr/bin/env bash
make theme
TMPDIR=$(mktemp -d)
jekyll build . --destination $TMPDIR

node_modules/.bin/grunt watch &
GRUNTPID="$!"

pushd $TMPDIR
python -m SimpleHTTPServer &
SERVEPID="$!"
popd

trap  "kill ${SERVEPID} ${GRUNTPID} ; rm -rf $TMPDIR" SIGINT
watch -n 2 jekyll build . --destination $TMPDIR

