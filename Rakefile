require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task default: :spec

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

task :run_task_from_env do
  sh "bundle exec rake #{ENV['TASK']}"
end
