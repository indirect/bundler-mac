# bundler-mac

The `bundler-mac` gem is a plugin for Bundler that automatically excludes bundled gems from Time Machine backups and Spotlight indexing. This can save a lot of time and effort on your computer's part, as well as potentially saving you money on backup disks.

## Installation

1. Make sure you're in your home directory by running `cd` (with no arguments).
1. Then, run `bundle plugin install bundler-mac`.
1. There is no step three.

## Usage

Everything is automatic whenever you run `bundle install` as usual.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/indirect/bundler-mac. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/indirect/bundler-mac/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bundler::Mac project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/indirect/bundler-mac/blob/main/CODE_OF_CONDUCT.md).
