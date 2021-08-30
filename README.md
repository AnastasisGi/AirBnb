# MairBnb
(in progress)

A night-let room  app where a  hosts can upload their rooms and guests can book the night. 

## Set Up & tests

``` 
   $ git clone && cd ./AirBnb
   $ bundle install
   $ bundle exec rake db:create
   $ bundle exec rake db:migrate RACK_ENV=development
   $ bundle exec rackup
   $ bundle exec rake db:migrate RACK_ENV=test
   $ bundle exec rspec
```
