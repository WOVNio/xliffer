$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'xliffer/version'

Gem::Specification.new do |s|
  s.name        = 'xliffer'
  s.version     = XLIFFer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.date        = '2012-01-01'
  s.summary     = 'A XLIFF parser'
  s.description = 'A parser for XLIFF files'
  s.authors     = ['Felipe Tanus']
  s.email       = 'fotanus@gmail.com'
  s.homepage    = 'http://github.com/fotanus/xliff'

  s.required_ruby_version = Gem::Requirement.new('>= 2.6.6')

  s.add_dependency 'nokogiri', '~> 1.10.9'

  s.add_development_dependency 'equivalent-xml'
  s.add_development_dependency 'rspec', '~> 3'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-performance'
  s.add_development_dependency 'simplecov', '>= 0.9.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map do |f|
    File.basename(f)
  end
  s.require_paths = ['lib']
end
