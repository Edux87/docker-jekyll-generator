#!/bin/bash

MESSAGE="valid options: [new, build, serve]"
echo $MESSAGE

for opt in "$@"
do
  case $opt in
  new)
    echo "Create a New Awesome Site!"
    jekyll new site
    ;;
  build)
    echo "Built!"
    cd site/
    jekyll build
    ;;
  serve)
    echo "Initialize Server!"
    cd site/
    jekyll serve $1 $2 $3 --host 0.0.0.0
    ;;
  esac
done
