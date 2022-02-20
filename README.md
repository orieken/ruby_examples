Tests in Ruby
___

## Info
* ruby 3
* bundler 2.2.3


1. bundle install
2. bundle exec rake (default will run api, ui specs, and cucumber scenarios)

## Rake tasks
* `bundle exec rake` will run api and ui specs
* `bundle exec rake api` will run api specs
* `bundle exec rake ui` will run ui specs
* `bundle exec rake -T` to see all available tasks
* webdrivers tasks were added to handle chromedriver setup

## Run in docker 
`docker run -it -v /Users/riekeno/Projects/ruby_project:/workspace ruby_project`

## Gotchas
* used xpath for quick and dirty solution. would have preferred aria, data-test-id, or id attributes

## TODO's
* add rake task to run everything in docker

