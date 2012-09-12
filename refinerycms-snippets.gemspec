Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-sl-snippets}
  s.version           = %q{1.0.0}
  s.description       = %q{Ruby on Rails Snippets engine for Refinery CMS}
  s.date              = %q{2012-09-05}
  s.summary           = %q{Html snippets for Refinery CMS page}
  s.authors           = ['Rodrigo García Suárez', 'Simplelogica', 'Marek L.']
  s.email             = %q{rodrigo@simplelogica.net}
  s.require_paths     = %w(lib)
  s.homepage          = %q{https://github.com/simplelogica/refinerycms-snippets}
  
  s.add_dependency    'refinerycms-pages', '>= 2.0.0'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
end
