require 'cucumber'
require 'cucumber/rake/task'

namespace :cucumber do
    desc "Run Cucumber Tests"
    task :run, [:features] do |_ , args|
        args.with_defaults(:features=>nil)
        Cucumber::Rake::Task.new do |t|
            t.fork = false
            t.cucumber_opts = args[:features] unless args[:features].nil?
            t.runner.run
        end
    end

    desc "Run Cucumber with profile"
    task :profile, [:profile,:features] do |_ , args|
        raise(ArgumentError, "Profile must be defined") if args[:profile].nil?
        Cucumber::Rake::Task.new do |t|
            t.fork = false
            t.cucumber_opts = args[:features] unless args[:features].nil?
            t.profile = args[:profile]
            t.runner.run
        end 
    end
end