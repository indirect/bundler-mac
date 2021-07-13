# frozen_string_literal: true

require_relative "mac/version"

module Bundler
  module Mac
    def self.after_install_all(_)
      # Don't exclude "system" gems
      return unless Bundler.settings[:path]

      # Skip Spotlight indexing inside the bundle
      Bundler.bundle_path.join(".metadata_never_index").write("")

      # Tell Time Machine to skip backing up the bundle
      require_relative "mac/xattr"
      path = Bundler.bundle_path.to_s
      exclude_key = "com.apple.metadata:com_apple_backup_excludeItem"
      exclude_value = "bplist00_\x10\x11com.apple.backupd\b"
      Bundler.ui.debug "[time machine excluded] #{path}"
      Xattr.setxattr(path, exclude_key, exclude_value, exclude_value.size, 0, 0)
    rescue => e
      # If something goes wrong, trace in debug mode but otherwise continue.
      # This isn't critical functionality.
      Bundler.ui.trace(e)
    end
  end
end
