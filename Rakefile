require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

require 'lib/lomo/version'

task :default => :test

spec = Gem::Specification.new do |s|
  s.name             = 'lomo'
  s.version          = Lomo::Version.to_s
  s.has_rdoc         = true
  s.extra_rdoc_files = %w(README.markdown)
  s.summary          = "Apply a lomo filter to your pictures from the command line"
  s.author           = 'Michel Martens'
  s.email            = 'michel@soveran.com'
  s.homepage         = 'http://github.com/soveran/lomo'
  s.files            = %w(README.markdown Rakefile) + Dir.glob("{lib,test,img}/**/*")
  s.bindir           = "bin"
  s.executables      = "lomo"
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

desc 'Generate the gemspec to serve this Gem from Github'
task :github do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end
