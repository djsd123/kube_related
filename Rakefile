require 'colorize'
require 'fileutils'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task :default => ["prerequisites:check_tfjson", "prerequisites:check_for_golang", :spec]

namespace :prerequisites do
  GOLANG_VERSION_REQUIRED = 'go1.8'
  TFJSON_SUPPORTED_TERRAFORM_VERSION = '0.8.8'
  task :check_for_golang do
    matching_golang_version_found = `go version | grep -- #{GOLANG_VERSION_REQUIRED}`
    if matching_golang_version_found.empty?
      raise "ERROR: #{GOLANG_VERSION_REQUIRED} is not installed. You'll need to setup and install Golang version at least #{GOLANG_VERSION_REQUIRED} to continue.".red
    else
      puts "Good to Go......".green
    end
  end

  task :check_tfjson do
    tfjson_repo = 'github.com/palantir/tfjson'
    `which tfjson`
    unless $? == 0
      command = "go get #{tfjson_repo}"
      command2 = "go install #{tfjson_repo}"
      puts "Installing tfjson"
      system(command)
      system(command2)
    end
  end
end

PROJECT_DIR = '.'

desc 'Run the current terraform directories aws spec tests'
RSpec::Core::RakeTask.new('spec') do |task|
   task.pattern = PROJECT_DIR
end
