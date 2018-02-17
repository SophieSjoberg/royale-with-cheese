# Royale with Cheese
Mid-Course project for Craft Academy October 2017 Cohort.

## Description
Royale with Cheese is an app to search movies by a specific genre.
This was our first approach with APIs, we connected to
https://www.themoviedb.org/documentation/api to get the results we wanted.
We also made our first user authentication process with Devise and implemented orders and order summary page.

## Contributors
* Francesco Falchi: https://github.com/NegativeKarma
* Scott Bartels: https://github.com/ScottyyyB
* Sophie Sjöberg: https://github.com/sophiesjoberg
* Zuzanna Bienkowska: https://github.com/zuzanna81/

## Technologies
* Ruby on Rails
* Bootstrap
* themoviedb-api
* devise
* coffee-rails
* acts_as_shopping_cart

## Installation
Download the ZIP file from this repo.  
Unzip the file and then open it up via your terminal.  
Run `bundle install`, after run `rails db:create db:migrate`.  
Run `rails s` and go to http://localhost:3000/

## How to use it
You can use the app both from https://royale-with-cheese-wsix.herokuapp.com/ and
http://localhost:3000/ if you're running it through `rails s`.  
When you're on the landing page you can search for a movie from this genres:  
**Action  
Adventure  
Animation  
Comedy  
Crime  
Documentary  
Drama  
Family  
Fantasy  
History  
Horror  
Music  
Mystery  
Romance  
Science Fiction  
TV Movie  
Thriller  
War  
Western**  
You'll get the 5 most relevant movies as a result for searching any of these genre.

You can register an account too.

## Testing
* cucumber-rails
* rspec-rails
* pry-rails
* factory_bot_rails
* launchy
* selenium-webdriver
* chromedriver-helper
* shoulda-matchers
* webmock
* awesome_print
* stripe-ruby-mock

### Acceptance test
Acceptance test are written in Cucumber using Capybara and Selenium with Chrome Driver in headless state.

Features are stored in `./features`

To run the acceptance test suite, execute Cucumber in you terminal:

```bash
$ cucumber
```

### Unit tests
Unit test are written in rspec

```bash
$ rspec
```

#### Active Models
Active Record Models are tested using RSpec (model specs)

We are using Shoulda matchers to test the expected database tables, validations and permissions.
We are also allowing, via validations, the objects created by FactoryBot to be tested
