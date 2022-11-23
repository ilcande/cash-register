# Documentation
## Development Env and Features
* created a Ruby project and initialized the `Gemfile` by running `bundle install`

then executed

  ```
    $ rspec --init
  ```

  to set up test environment

The gems and dependencies reported below were then installed:

* `gem 'pry'`
* `gem 'pry-byebug'`

These two gems were added in order to debug the app.
Add `require 'pry'` at the top of the file where you need debugging,
then add `binding.pry` within the method you want to investigate and run either the app or the tests.

Debugging activity won't be tracked as `.byebug_history` was added to `.gitignore`

* `gem 'rubocop', require: false`

This gem was added in order to analyze and format the code according to
ruby standard guidelines reported on [Ruby Style Guides](https://rubystyle.guide/)

* `gem 'simplecov', require: false, group: :test`

Added this gem in order to keep track of overall coverage tests results for the project.
After running test, check the coverage report which is generated

You can find a screenshot of the report in `coverage/assets`.

run `open coverage/index.html` to open the file in your browser and check the report.

