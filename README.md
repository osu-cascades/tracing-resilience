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
user for you. See _db/seeds.rb_ for the default username and password.

This application uses the [recaptcha gem](https://github.com/ambethia/recaptcha)
which in turn requires that the environment variables `RECAPTCHA_SECRET_KEY` and
`RECAPTCHA_SITE_KEY` be set. Since the _Gemfile_ includes the
[figaro gem](https://github.com/laserlemon/figaro), use it to store environment-
based config. Generate an empty config file:

`figaro install`

[Obtain a recaptcha secret key and site key](https://www.google.com/recaptcha)
for localhost, and edit _config/application.yml_. For example, your
_config/application.yml_ might look like this:

```
RECAPTCHA_SITE_KEY: abcd123
RECAPTCHA_SECRET_KEY: efgh789
```

 Now run the application:

`rails server`

## Test

This application uses rspec. Run the test with spring for speed:

`spring rspec`

A _Guardfile_ is also present in this project, and it is pre-configured to
run rspec with spring. To use it, just run `guard` as usual.

## Deployment

TODO

&copy; 2019 Nathan Struhs, Yong Bakos. All rights reserved.
