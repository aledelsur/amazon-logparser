Gem::Specification.new do |s|
  s.name        = 'parser'
  s.version     = '0.0.1'
  s.date        = '2010-04-28'
  s.summary     = "Ejercicio de Amazon"
  s.description = "Ejercicio técnico de Amazon"
  s.authors     = ["Alejandro Alvarez"]
  s.email       = 'nick@quaran.to'
  s.files       = ["lib/parser.rb", "lib/host.rb", "lib/array.rb", "lib/workers/log_parser.rb"]
  s.homepage    = 'http://rubygems.org/gems/host'

  s.require_paths = ["lib", "lib/workers"]

  s.add_runtime_dependency 'active_support'
  s.add_runtime_dependency 'resque-scheduler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
