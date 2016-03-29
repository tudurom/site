#!/bin/sh

build() {
  echo "$(tput setaf 2)$(tput bold)BUILDING: $1$(tput sgr0)"

  ext="$(echo $dir | rev | cut -d. -f1 | rev)"
  case "$ext" in
    md)
      test -f "$PWD/$1/content.html" && rm "$PWD/$1/content.html"
      pandoc -f markdown_github -t html5 "$PWD/$1/content.md" > "$PWD/$1/content.html"
      ;;
  esac
  source "$PWD/$1/metadata"
  export content="$(cat $PWD/$1/content.html)"
  source "$PWD/template.html" > "gen/$(echo "$1" | cut -d. -f1).html"
}

install_page() {
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

ls -N | grep "\." |\
while read -r file; do
  test -d "$file" && build "$file"
done

install_page "gen/index.html" "../index.html"

install_page "css/" "../css"
install_page "js/" "../js"

exit 0
