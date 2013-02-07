# ABTest

Very simple ABTest functionality for Ruby

## Installation

Add this line to your application's Gemfile:

    gem "ab_test"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ab_test

## Usage

### Configure the experiments

    # config/ab_exeperiments.yml
    experiment_monkey:
      - "alternative_monkey_1"
      - "alternative_monkey_2"

    experiment_elefant:
      - "alternative_elefant_1"
      - "alternative_elefant_2"
      - "alternative_elefant_3"

### Create the table

    rails generate ab_test_migration
    rake db:migrate

### Experiment!

#### LandingPage experiment

    redirect_to ABTest.get(:experiment_monkey, current_user)

#### CSS experiment

    <%= stylesheet_link_tag "/assets/css/#{ABTest.get(:experiment_monkey, current_user)}.css" %>

### Convert!

    if user.has_bought_something?
      ABTest.get(:experiment_monkey, user).conversion!
    end

## Sate of the art

Beta version but already used in production environments
