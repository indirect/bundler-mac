# frozen_string_literal: true

require "fiddle"
require "fiddle/import"

module Bundler
  module Mac
    module Xattr
      extend Fiddle::Importer
      dlload Fiddle::Handle::DEFAULT
      extern "int setxattr(const char *, const char *, void *, int, int, int)"
    end
  end
end
