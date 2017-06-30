# Pros Use... 
## Audio Equipment Inventory

# Demo
[Check out the demo of Pros Use...](https://prosuse.herokuapp.com)

# Project Outline
This project has a simple setup involving Users, Rigs, and Items:

* Users have many rigs (e.g. Recording rig, live rig, home rig)
* Rigs have many items (e.g. 3 Sennheiser mics, 1 Midas board, 4 IEMs)
* Items have many rigs, users (e.g. Sennheiser SKM 9000 is used by Brendan O'Brien on his Recording rig)

# README

## Installation

Pros Use... requires Ruby v. ~> 2.3 and Bundler v. ~> 1.14

To install, clone this repository anywhere on your computer and run `bundle install`. Run `rake db:migrate` and `rake db:seed` to create and seed the development database.


This program includes Omniauth Facebook authentication, which requires a Facebook developer account and an App ID and Secret code. See [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook) for more details.

## Testing

Testing using `rspec`. Simply run the command `rspec` in the project directory to run the test suite. Before testing, however, you will need to run `rake db:migrate RAILS_ENV=test` to create the test database file.

## Contributing

Contributing to this project is encouraged! Simply make a pull request via Github, and I will review your changes personally. Please direct all questions to michaeldavidoconnell@gmail.com
