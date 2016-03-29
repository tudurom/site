cat << EOF
  $(. "$PWD/header.html.sh")
    ${content}
  $(. "$PWD/footer.html.sh")
EOF
