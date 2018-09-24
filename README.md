# Cron Parser

A demo CLI application that parses and expands the cron time format

## Getting Started

These instructions will get you a copy of the project up and running on your local machine 
for development and testing purposes.

### Installing

Project uses Ruby 2.5.1

Install Ruby and Bundler
```
rvm install $(cat .ruby-version )
gem install bundler
```

Install all dependencies

```
bundle install
```

That's it, now it's all set up!

### Usage

```bash
bin/cron_parser "*/15,2,20-30 0 1,15 * 1-5" "/usr/bin/find"
```
Note that both arguments are surrounded with double quotes to prevent bash expansion of *

#### Arguments

Command expects 2 arguments, first defines how often a command should be executed, second defined the command.

For the time definition, the format is following

```
"<minutes> <hours> <day> <months> <day of the week>"
```

#### Supported formats

* __\*__ every X (eg. every minute, or hour, etc.)
* __*/X__ once every X (eg. */10 every 10 minutes)
* ranges (eg. 12-14)
* multiple values (eg. 12, 13, 14)

## Running the tests

```bash
bundle exec rspec
```

### And coding style tests

```
bundle exec rubocop
```

## Deployment

This is a demo project which is meant to be ran locally

## TODO

* validation of input (number of arguments, right format)
* handling conflicts when day and day of the week are passed
* increase the test coverage (for month and days of the week expansion)
* write an integration test for bin/cron_parser
* write tests for presenter
* configure Rubocop to get to a clean state
* write a README