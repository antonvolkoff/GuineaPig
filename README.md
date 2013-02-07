# GuineaPig

Very simple ABTest functionality for Ruby, based in ActiveRecord and with Rails 3 generators

## Installation

Add this line to your application's Gemfile:

    gem "guinea_pig"

## Usage

### Configure the experiments

    # config/ab_experiments.yml
    experiment_monkey:
      - "alternative_monkey_1"
      - "alternative_monkey_2"

    experiment_elefant:
      - "alternative_elefant_1"
      - "alternative_elefant_2"
      - "alternative_elefant_3"

### Create the table

    rails generate guinea_pig:migration
    rake db:migrate

### Experiment!

#### LandingPage experiment

    redirect_to GuineaPig.get(:experiment_monkey, current_user)

#### CSS experiment

    <%= stylesheet_link_tag "/assets/css/#{GuineaPig.get(:experiment_monkey, current_user)}.css" %>

### Convert!

    if user.has_bought_something?
      GuineaPig.get(:experiment_monkey, user).conversion!
    end

## Sate of the art

Beta version but already used in production environments
