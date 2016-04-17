#!/bin/sh

for article in *; do
  # the res dir is special. skip it
  if [ "$article" != "res" ]; then
    source "${article}/metadata"

    year="$(echo "$date" | cut -d'-' -f1)"
    month="$(echo "$date" | cut -d'-' -f2)"
    day="$(echo "$date" | cut -d'-' -f3)"

    test -d "../${url}" || mkdir "../${url}"

    content="$(pandoc -f markdown_github -t html5 "${article}/content.md")"
  fi
done
