require_relative "boot"

require "dry/auto_inject"
require 'dry/system'
require "dry/system/container"
require './lib/bix/repos/user_repo' # FIXME: Why does this not autoload?

module Bix
  class Application < Dry::System::Container
    configure do |config|
      config.root = File.expand_path('..', __dir__)

      # See https://github.com/dry-rb/dry-system/blob/main/CHANGELOG.md#changed-8
      config.component_dirs.add "lib" do |dir|
        dir.namespaces.add 'bix', key: nil
      end

      config.component_dirs.auto_register = 'lib'
    end
  end

  Import = Dry::AutoInject(Application)
end
