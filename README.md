# Kuruka

[![Build Status](https://travis-ci.org/andela-tpeters/k_test.svg?branch=from-d)](https://travis-ci.org/andela-tpeters/k_test)
[![Coverage Status](https://coveralls.io/repos/github/andela-cnwosu/kuruka/badge.svg?branch=develop)](https://coveralls.io/github/andela-cnwosu/kuruka?branch=develop)
[![Issue Count](https://codeclimate.com/github/andela-cnwosu/kuruka/badges/issue_count.svg)](https://codeclimate.com/github/andela-cnwosu/kuruka)

##Description

Kuruka is a web application for booking flight reservations. It enables a user to search for flights going from one location to another at a given time.
The application can be viewed here [Kuruka](http://kuruka.herokuapp.com)

##Features

With this application, a user can:

* search for flights according to criteria
* book preferred flights according after selecting from search 
* manage past bookings
* view all past booking history
* receive email notifications after booking a flight
* edit a past reservation
* have and manage a profile account
* make payments for reservations using paypal

##Frameworks

This application is running on Rails 5!
The front-end design was implemented with Bootstrap 3.3.6 and it runs on a puma server.
Tests were done with RSpec and Capybara.

##Getting Started

###Dependencies

To run this application. you need to install <a href="https://www.ruby-lang.org" target ="blank">Ruby</a>  and <a href="http://rubyonrails.org/" target="blank">Rails</a>. Every other dependency can be install with ruby gems.

### Run Locally

Clone the application to your local machine:

```
$ git clone https://github.com/andela-cnwosu/kuruka.git
```

Install the dependencies from the Gemfile

```
$ bundle install
```

Migrate database

```
$ rails db:migrate
```

Seed database

```
$ rails db:seed
```

Start the server on puma

```
$ rails server
```
Visit http://localhost:3000 to view the application on your browser.

# Running the Tests

Start tests by running the command on the root folder:

```
rspec spec
```
or

```
bundle exec rspec
```

# Contributing

You can give bug reports and make pull requests by forking the repository on GitHub at https://github.com/andela-cnwosu/kuruka
