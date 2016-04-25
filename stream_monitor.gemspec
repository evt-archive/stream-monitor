# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'stream_monitor'
  s.version = '0.0.0.0'
  s.summary = 'Check and alert on stream metrics'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/stream_metrics_telemetry'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'metrics-stream-divergence'
  s.add_runtime_dependency 'ops_genie_client'

  s.add_development_dependency 'test_bench'
end
