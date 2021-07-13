# frozen_string_literal: true

require_relative "mac/version"
require_relative "mac/xattr"

module Bundler
  module Mac

    def self.after_install_all(_)
      path = Bundler.bundle_path.to_s

      # Don't exclude "system" gems
      return unless Bundler.settings[:path]

      # Skip Spotlight indexing inside the bundle
      Bundler.root.join(".metadata_never_index").write("")

      # Tell Time Machine to skip backing up the bundle
      exclude_key = "com.apple.metadata:com_apple_backup_excludeItem"
      exclude_value = "bplist00_\x10\x11com.apple.backupd\b"
      Bundler.ui.debug "[time machine excluded] #{path}"
      Xattr.setxattr(path, exclude_key, exclude_value, exclude_value.size, 0, 0)
    end

  end
end
