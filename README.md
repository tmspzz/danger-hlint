# Danger HLint [![Gem Version](https://badge.fury.io/rb/danger-hlint.svg)](https://badge.fury.io/rb/danger-hlint)

A Danger plugin for [HLint](https://github.com/ndmitchell/hlint)

## Installation

Add this line to your Gemfile:

```ruby
gem 'danger-hlint'
```

## Usage

Methods and attributes from this plugin are available in
your `Dangerfile` under the `hlint` namespace.

At the moment one single method is exposed: `hlint.lint`

If you want the lint results to show in the diff instead of in the comments, you can use then `inline_mode` option.
Violations that occur out of the diff will show in danger's fail or warn section.

```ruby
hlint.lint files inline_mode: true
```

To pass other parameters to the linter just add them to the method call. The
names and values of the parameters to the `hlint.lint` method are handed over to linter.

For example, you can specify a hint file by calling

```ruby
hlint.lint files hint: ".hlint.yaml" # pass false one comment
```

To pass switches to the linter (like `--quiet`) specify `true` as the value in the call

```ruby
hlint.lint files quiet: true
```


## Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.

## Attribution

Some methods and ideas are almost copied unchanged from [Danger SwiftLint](https://github.com/ashfurrow/danger-swiftlint)

## License

danger-hlint is released under MIT License
