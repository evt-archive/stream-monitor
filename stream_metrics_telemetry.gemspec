# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'stream_metrics_telemetry'
  s.version = '0.0.0.0'
  s.summary = 'Measurement of divergence in time of the heads of streams'
  s.description = ' '

  s.authors = ['Obsidian Software, Inc']
  s.email = 'opensource@obsidianexchange.com'
  s.homepage = 'https://github.com/obsidian-btc/stream_metrics_telemetry'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'metrics-stream-divergence'

  s.add_development_dependency 'test_bench'
end
