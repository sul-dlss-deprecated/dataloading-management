# frozen_string_literal: true

OkComputer.mount_at = "status"
OkComputer.check_in_parallel = true

# Required
OkComputer::Registry.register "ruby_version", OkComputer::RubyVersionCheck.new
