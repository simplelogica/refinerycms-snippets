#!/usr/bin/env ruby
# -*- coding: undecided -*-
require File.expand_path('../refinery/snippets/version', __FILE__)

files = Dir.glob("**/*").flatten.reject do |file|
  file =~ /\.gem$/
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{sl-refinerycms-snippets}
  s.version           = %q{#{Refinery::Snippets::VERSION}}
  s.description       = %q{Ruby on Rails Snippets engine for Refinery CMS}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Html snippets for Refinery CMS page}
  s.authors           = ['Rodrigo García Suárez', 'Simplelogica', 'Marek L.']
  s.email             = %q{rodrigo@simplelogica.net}
  s.require_paths     = %w(lib)
  s.homepage          = %q{https://github.com/simplelogica/refinerycms-snippets}
  
  s.add_dependency    'refinerycms-pages', '>= 2.0.0'

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  s.require_path = 'lib'
end
EOF

File.open(File.expand_path("../../refinerycms-snippets.gemspec", __FILE__), 'w').puts(gemspec)
