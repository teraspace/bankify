# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby on rails versions
  Ruby 2.7.5
  Rails 6.0.*

* System dependencies
  Docker Compose 2.10.*
  Docker Engine 10

To start bankify:

1. Build container
  docker-compose build

2. Database initialization
  docker-compose run web rake db:create db:migrate RAILS_ENV=development

3. Run
  docker-compose build and docker-compose up consecutively

4. Open http://localhost:3000 in your browser
