#!/bin/sh

MAIN_PAGE_TITLE="tudor's blog"

for article in $(ls -1 | grep -Ev "res|tm"); do
    # only consider directories
    # the res dir is special. skip it
    if [ -d "$article" ]; then
        echo "$(tput setaf 8)[ HTML ]$(tput setaf 10) $article$(tput sgr0)"

        . "${PWD}/${article}/metadata"

        year="$(echo "$date" | cut -d'-' -f1)"
        month="$(echo "$date" | cut -d'-' -f2)"
        day="$(echo "$date" | cut -d'-' -f3)"

        test -d "../${url}" || mkdir "../${url}"

        # calls `mark` to convert markdown to html
        gen_post="$(mark "${article}/content.md")"
        export content="$gen_post"
        export page_title="$title │ $MAIN_PAGE_TITLE"
        gen_post="$(. "$PWD/res/post.html")"
        export content="$gen_post"
        # title and subtitle are already exported

        # generates page
        . "$PWD/res/template.html" > "../${url}/index.html"

        index_links="${index_links} <li><span>${date}</span> <a href=\"${article}\">${title}</a></li>"
    fi
done

echo "$(tput setaf 8)[ HOME ]$(tput setaf 10) Generating index page$(tput sgr0)"
export content="$index_links"
links_page="$(. "${PWD}/res/post_list.html")"

export content="$links_page"
export page_title="$MAIN_PAGE_TITLE"

# generate index page with links to all articles
. "${PWD}/res/template.html" > "../index.html"

# generate css
cd ../css
echo "$(tput setaf 8)[ SCSS ]$(tput setaf 10) Generating css$(tput sgr0)"
scss main.scss > main.css
