#!/bin/bash

MESSAGE="valid options: [new, build, serve]"
echo $MESSAGE

for opt in "$@"
do
  case $opt in
  new)
    echo "Create a New Awesome Site!"
    bundle exec jekyll new site
    ;;
  build)
    echo "Built!"
    cd site/
    bundle exec jekyll build
    ;;
  serve)
    echo "Initialize Server!"
    cd site/
    bundle exec jekyll serve $1 $2 $3 --host 0.0.0.0
    ;;
  esac
done
