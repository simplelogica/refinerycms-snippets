Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-sl-snippets}
  s.version           = %q{1.1.2}
  s.description       = %q{Ruby on Rails Snippets engine for Refinery CMS}
  s.date              = %q{2012-09-12}
  s.summary           = %q{Html snippets for Refinery CMS page}
  s.authors           = ['Rodrigo García Suárez', 'Simplelógica', 'Marek L.']
  s.email             = %q{rodrigo@simplelogica.net}
  s.require_paths     = %w(lib)
  s.homepage          = %q{https://github.com/simplelogica/refinerycms-snippets}

  s.add_dependency    'refinerycms-pages', '~> 2.1.0.dev'

  s.files       = `git ls-files`.split("
")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("
")
  s.require_path = 'lib'
end
