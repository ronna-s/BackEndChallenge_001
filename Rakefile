# Rakefile
require 'sinatra/activerecord/rake'
require_relative 'daycare/daycare'

desc 'List defined routes'
task 'routes' do

  Daycare::routes.each_pair do |method, list|
    puts ":: #{method} ::"
    routes = []
    list.each do |item|
      source = item[0].source
      item[1].each do |s|
        source.sub!(/\(.+?\)/, ':'+s)
      end
      routes << source[1...-1]
    end
    puts routes.sort.join("\n")
    puts "\n"
  end

end

namespace :db do
  task :load_config do
    require "./daycare/daycare"
  end
end


task :spec do
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = File.join('daycare', t.pattern)
  end
end

