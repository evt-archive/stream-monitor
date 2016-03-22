ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_COLOR'] ||= 'on'

if ENV['LOG_LEVEL']
  ENV['LOGGER'] ||= 'on'
else
  ENV['LOG_LEVEL'] ||= 'trace'
end

ENV['LOGGER'] ||= 'off'

puts RUBY_DESCRIPTION

require_relative '../init.rb'

require 'stream_monitor/controls'

require 'test_bench'; TestBench.activate

Telemetry::Logger::AdHoc.activate
