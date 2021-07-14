# frozen_string_literal: true

require "tmpdir"
require "shellwords"

RSpec.describe Bundler::Mac do
  it "has a version number" do
    expect(Bundler::Mac::VERSION).not_to be nil
  end

  def xattrs(path)
    `/usr/bin/xattr #{Shellwords.escape(path)}`
  end

  def bundle_path
    Dir.glob(".bundle/ruby/*").first
  end

  it "sets the Time Machine xattr and spotlight file" do
    spec_dir = Dir.pwd

    Dir.mktmpdir("spec/tmp") do |dir|
      Dir.chdir(dir) do
        File.write "Gemfile", ""
        Bundler.with_unbundled_env do
          expect(bundle_path).to eq(nil)
          system "bundle config path .bundle"
          system "bundle plugin install --local-git=#{Shellwords.escape(spec_dir)} bundler-mac"
          system "bundle install"
          expect(xattrs(bundle_path)).to eq("com.apple.metadata:com_apple_backup_excludeItem\n")
          expect(Dir.glob("#{bundle_path}/.m*").first).to end_with(".metadata_never_index")
        end
      end
    end
  end
end
