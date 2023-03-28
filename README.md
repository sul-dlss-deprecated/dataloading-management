[![CircleCI](https://circleci.com/gh/sul-dlss/dataloading-management.svg?style=svg)](https://circleci.com/gh/sul-dlss/dataloading-management)
[![Maintainability](https://api.codeclimate.com/v1/badges/08fa54389d9487681046/maintainability)](https://codeclimate.com/github/sul-dlss/dataloading-management/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/08fa54389d9487681046/test_coverage)](https://codeclimate.com/github/sul-dlss/dataloading-management/test_coverage)

# Vendor Management Data Loading Application

## Install Dependencies

Ruby dependencies can be installed with `bundle install`, JavaScript dependencies are installed via `yarn install`.

NOTE: Data loading management uses Ruby 3.1.2.

## Development

Start up dependencies with `docker compose up db ` (with `-d` to run in background).

### Development Server

First install foreman (foreman is not supposed to be in the Gemfile, See this [wiki article](https://github.com/ddollar/foreman/wiki/Don't-Bundle-Foreman) ):

```
gem install foreman
```

Then run the asset pipeline and webserver:
```shell
bin/dev
```
