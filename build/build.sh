#!/bin/sh -x

build() {
    echo "$(tput setaf 2)$(tput bold)BUILDING: $1$(tput sgr0)"

    # Take only directories with an extension at the end
    ext="$(echo $1 | rev | cut -d. -f1 | rev)"
    case "$ext" in
        # Special cases
        md)

        local usemd="true"
        test -f "$PWD/$1/content.html" && rm "$PWD/$1/content.html"
        mark "$PWD/$1/content.md" > "$PWD/$1/content.html"
        ;;

    esac
    # Read metadata
    # the metadata file needs to have this form:
    # export title="title here"
    . "$PWD/$1/metadata"
    export content="$(cat $PWD/$1/content.html)"
    . "$PWD/template.html.sh" > "gen/$(echo "$1" | cut -d. -f1).html"

    test "$usemd" = "true" && rm "$PWD/$1/content.html"
}

install_page() {
    # Copies the generated file to the target dir
    if [ -d "$1" ]; then
        rm -rf "$2"
        cp -v -R "$1" "$2"
    else
        rm "$2"
        cp -v "$1" "$2"
    fi
}

test -d gen && rm -rf gen
mkdir gen

# Build only files that end with an extension
ls -N | grep "\." |\
    while read -r file; do
        test -d "$file" && build "$file"
    done

    install_page "gen/index.html" "../index.html"
    mkdir ../whoami
    install_page "gen/whoami.html" "../whoami/index.html"

    install_page "css/" "../css"
    install_page "js/" "../js"
    install_page "fonts/" "../fonts"

    exit 0
