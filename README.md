# Docker Jekyll Generator
[spanish reference](https://edux87.github.io/docker/2016/12/07/docker-jekyll-generator.html)

## About jekyll
[Jekyll](http://jekyllrb.com/) has an extensive theme system, which allows you to leverage community-maintained templates and styles to customize your site’s presentation. Jekyll themes package layouts, includes, and stylesheets in a way that can be overridden by your site’s content.

## About Docker
Docker containers wrap a piece of software in a complete filesystem that contains everything needed to run: code, runtime, system tools, system libraries – anything that can be installed on a server. This guarantees that the software will always run the same, regardless of its environment.

# How Use this Image?

## For Create a New Site
	  mkdir blog
	  cd blog/
		docker run -v $(pwd):/src/site:rw -it edaniel15/jekyll-generator new
		docker run -v $(pwd):/src/site:rw -it edaniel15/jekyll-generator build
		docker run -v $(pwd):/src/site:rw -p 4000:4000 -it edaniel15/jekyll-generator serve

## Alias?
	alias jekyll='docker run -v $(pwd):/src/site:rw -it edaniel15/jekyll-generator'
	cd /my-awesome-site
	jekyll new
	jekyll build
	jekyll serve # pro version
	jekyll serve --config _config.yml,_config-dev.yml # dev version include a file _config-dev.yml

### About jekyll serve in dev mode
In this case, you must create a file `_config-dev.yml`, This file will overwrite the `_config.yml` file and then start the server

# Dev?
Install docker, and clone this repo, after create the image with:

    git clone https://github.com/Edux87/docker-jekyll-generator.git
    cd docker-jekyll-generator/
    docker build -t jekyll-generator .
