# Docker Jekyll Generator

## About jekyll
[Jekyll](http://jekyllrb.com/) has an extensive theme system, which allows you to leverage community-maintained templates and styles to customize your site’s presentation. Jekyll themes package layouts, includes, and stylesheets in a way that can be overridden by your site’s content.

## About Docker
Docker containers wrap a piece of software in a complete filesystem that contains everything needed to run: code, runtime, system tools, system libraries – anything that can be installed on a server. This guarantees that the software will always run the same, regardless of its environment.

# How Use this Image?

## For Create a New Site
	docker run -v $(pwd):/jekyll/site:rw -it jekyll new

## Alias?
	alias='docker run -v $(pwd):/jekyll/site:rw -it jekyll'
	cd /my-awesome-site
	jekyll new
	jekyll build
	jekyll serve

# Dev?
Install docker, and clone this repo, after create the image with:

    git clone https://github.com/Edux87/docker-jekyll-generator.git
    cd docker-jekyll-generator/
    docker build -t jekyll-generator .
