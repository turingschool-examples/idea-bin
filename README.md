# Steve's Notes

First and foremost, let's create a new project with all of the appropriate settings.

```
rails new idea-bin -jB --skip-turbolinks
```

Add the following to the Gemfile:

```rb
gem 'teaspoon'
gem 'teaspoon-mocha'
gem 'magic_lamp'
gem 'database_cleaner'
```

We'll make sure our `spec_helper.js` includes Chai and loads our favorite assertion library.

Run the basic setup for getting Teaspoon setup:

```
rails generate teaspoon:install --framework=mocha
```

In `routes.rb`, let's set up Magic Lamp:

```rb
mount MagicLamp::Genie, at: '/magic_lamp' if defined?(MagicLamp)
```

Next, in `spec/magic_lamp_config.rb`, we'll clean up the database after each test.

```rb
require 'database_cleaner'

MagicLamp.configure do |config|
  DatabaseCleaner.strategy = :transaction

  config.before_each do
    DatabaseCleaner.start
  end

  config.after_each do
    DatabaseCleaner.clean
  end
end
```

In `spec_helper.js`, we'll load the JavaScript library:

```js
//= require magic_lamp
```

In `spec/javascripts/magic_lamp.rb`, we'll setup our fixtures and grab our template:

```rb
MagicLamp.fixture do
  Idea.create(title: 'Amazing Idea', body: 'wowow')
  render template: 'ideas/index'
end
```

In our test, we'll use `MagicLamp.load("ideas/index");` to load up our template.
