require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

task :default => :test

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "maildir"
    gemspec.summary = "Read & write messages in the maildir format"
    gemspec.description = "A ruby library for reading and writing arbitrary messages in DJB's maildir format"
    gemspec.email = "aaron@ktheory.com"
    gemspec.homepage = "http://github.com/ktheory/maildir"
    gemspec.authors = ["Aaron Suggs", "Niklas E. Cathor"]
    gemspec.add_development_dependency "shoulda", ">= 0"
    gemspec.add_development_dependency "mail", ">= 0"
    gemspec.add_development_dependency "json", ">= 0"
    gemspec.add_development_dependency "ktheory-fakefs", ">= 0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

desc "Run benchmarks"
task :bench do
  load File.join(File.dirname(__FILE__), "benchmarks", "runner")
end
