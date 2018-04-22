#! /bin/bash
HERE="$(realpath "$(dirname "$0")")"

if [[ "$1" != "--no-token" ]] ; then
    # setup GitHub plugin data for local build
    export SSL_CERT_FILE="$HERE/cacert.pem"
    source "$HERE/github-token.sh"
    if [[ -z "$JEKYLL_GITHUB_TOKEN" ]] ; then
        echo "Could not load GitHub token!"
        echo "Make sure to follow the instructions in 'github-token.sh.sample'"
        echo "or launch this script with '$0 --no-token'."
        exit 1
    fi
fi

bundle exec jekyll serve --host 0.0.0.0 --port 4000 --draft

