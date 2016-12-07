#!/bin/bash

MESSAGE="please insert: new, build or serve"

if [ -z "$1" ]
  then
    echo $MESSAGE
    exit 1
fi

if [ $# -gt 1 ]
then
  echo $MESSAGE
  exit 1
fi

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
    jekyll serve --watch
    ;;
  *)
    echo $MESSAGE
    ;;
  esac
done
