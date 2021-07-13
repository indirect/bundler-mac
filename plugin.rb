# frozen_string_literal: true

require "bundler/mac"

Bundler::Plugin.add_hook("after-install-all") do |dependencies|
  Bundler::Mac.after_install_all(dependencies)
end
