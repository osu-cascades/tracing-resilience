# Tracing Resilience

A "clearing house" collection of childhood/youth resilience measures for the
[Central Oregon TRACES](http://tracesco.org/)
(trauma, resiliency, and adverse childhood experiences) partnership with
[United Way of Deschutes County](http://www.deschutesunitedway.org).

## Development

This is a Rails application, and using PostgreSQL is assumed. After cloning this
repository, create your database:

`rails db:setup`

This will create the database, migrate the schema and create an initial admin
user for you. Now run the application:

`rails server`

## Test

This application uses rspec. Run the test with spring for speed:

`spring rspec`

A _Guardfile_ is also present in this project, and it is pre-configured to
run rspec with spring. To use it, just run `guard` as usual.

## Deployment

TODO


&copy; 2018 Nathan Struhs, Yong Bakos. All rights reserved.
