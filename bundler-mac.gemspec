# frozen_string_literal: true

require_relative "lib/bundler/mac/version"

Gem::Specification.new do |spec|
  spec.name          = "bundler-mac"
  spec.version       = Bundler::Mac::VERSION
  spec.authors       = ["Andre Arko"]
  spec.email         = ["andre@arko.net"]

  spec.summary       = "exclude your bundle from Time Machine and Spotlight on macOS"
  spec.homepage      = "https://github.com/indirect/bundler-mac"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
