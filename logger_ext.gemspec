lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "logger_ext/version"

Gem::Specification.new do |gem|
  gem.name    = "logger_ext"
  gem.version = ::LoggerExt::VERSION
  gem.authors = %w(radiospiel)
  gem.email   = %w(radiospiel@open-lab.org)

  gem.summary     = "extend Ruby's default logger interface to support multiple arguments"
  gem.description = "extend Ruby's default logger interface to support multiple arguments"
  gem.homepage    = "https://github.com/radiospiel/postqueue"
  gem.license     = "MIT"

  gem.files       = Dir["**/*"].select { |d| d =~ %r{^(README|data/|ext/|lib/|spec/|test/)} }
  gem.executables = [ ]

  gem.add_development_dependency "rspec", "~> 3.5.0"
  gem.add_development_dependency "rake", "~> 10.5.0"
end
