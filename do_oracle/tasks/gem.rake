require 'rubygems/package_task'

GEM_SPEC = Gem::Specification.new do |s|
  # basic information
  s.name        = "do_oracle"
  s.version     = DataObjects::Oracle::VERSION

  # description and details
  s.summary     = 'DataObjects Oracle Driver'
  s.description = "Implements the DataObjects API for Oracle"

  # dependencies
  s.add_dependency "addressable", "~>2.0.0"
  s.add_dependency "extlib", "~>0.9.12"
  s.add_dependency "data_objects", DataObjects::Oracle::VERSION

  if JRUBY
    # no jdbc-oracle available
    # s.add_dependency "jdbc-mysql", ">=5.0.4"
    s.add_dependency "do_jdbc", DataObjects::Oracle::VERSION
    s.platform = "java"
  else
    s.platform    = Gem::Platform::RUBY
    s.extensions << 'ext/do_oracle_ext/extconf.rb'
  end


  # development dependencies
  s.add_development_dependency 'rspec', '~>1.2.0'

  # components, files and paths
  s.files = FileList["lib/**/*.rb", "spec/**/*.rb", "tasks/**/*.rake", "ext/**/*.{rb,c}",
                      "LICENSE", "Rakefile", "*.{rdoc,txt,yml}", "lib/*.jar"]

  s.require_path = 'lib'

  # documentation
  s.has_rdoc = false

  # project information
  s.homepage          = 'http://github.com/datamapper/do'
  s.rubyforge_project = 'dorb'

  # author and contributors
  s.author      = 'Raimonds Simanovskis'
  s.email       = 'raimonds.simanovskis@gmail.com'
end

gem_package = Gem::PackageTask.new(GEM_SPEC) do |pkg|
  pkg.need_tar = false
  pkg.need_zip = false
end

file "#{GEM_SPEC.name}.gemspec" => ['Rakefile', 'tasks/gem.rake'] do |t|
  puts "Generating #{t.name}"
  File.open(t.name, 'w') { |f| f.puts GEM_SPEC.to_yaml }
end

desc "Generate or update the standalone gemspec file for the project"
task :gemspec => ["#{GEM_SPEC.name}.gemspec"]