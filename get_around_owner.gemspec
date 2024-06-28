# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "get_around_owner/version"

Gem::Specification.new do |s|
  s.name        = "get_around_owner"
  s.version     = GetAroundOwner::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["OpenAPI-Generator", "yann120"]
  s.homepage    = "https://rubygems.org/gems/get_around_owner"
  s.summary     = "Getaround Owner API Ruby Gem"
  s.description = "Getaround Owner API Wrapper"
  s.license     = "Unlicense"
  s.required_ruby_version = ">= 2.7"
  s.metadata    = {}

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files         = Dir.glob('lib/**/*.rb') + Dir.glob('bin/*') + Dir.glob('*.md') + Dir.glob('LICENSE')
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
