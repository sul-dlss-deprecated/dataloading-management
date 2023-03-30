[![CircleCI](https://circleci.com/gh/sul-dlss/dataloading-management.svg?style=svg)](https://circleci.com/gh/sul-dlss/dataloading-management)
[![Maintainability](https://api.codeclimate.com/v1/badges/08fa54389d9487681046/maintainability)](https://codeclimate.com/github/sul-dlss/dataloading-management/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/08fa54389d9487681046/test_coverage)](https://codeclimate.com/github/sul-dlss/dataloading-management/test_coverage)
[![OpenAPI Validator](http://validator.swagger.io/validator?url=https://raw.githubusercontent.com/sul-dlss/dataloading-management/main/openapi.yml)](http://validator.swagger.io/validator/debug?url=https://raw.githubusercontent.com/sul-dlss/dataloading-management/main/openapi.yml)

# Vendor Management Data Loading Application

## Install Dependencies

Ruby dependencies can be installed with `bundle install`, JavaScript dependencies are installed via `yarn install`.

NOTE: Data loading management uses Ruby 3.1.2.

## Development

Start up dependencies with `docker compose up db` (with `-d` to run in background).

NOTE: If you get failures that references missing assets, you may need to manually compile them via:

```shell
bin/rake css:build
```

### Running the test suite

* Start the database container: `docker compose up db`
* Initialize the test database: `RAILS_ENV=test bin/rails db:prepare`
* Run the linter and the test suite: `bin/rake`

### Development Server

Run the asset pipeline and webserver via:
```shell
bin/dev
```

NOTE: this will automatically install the `foreman` gem (which should not be in the Gemfile per this [wiki article](https://github.com/ddollar/foreman/wiki/Don't-Bundle-Foreman)).
