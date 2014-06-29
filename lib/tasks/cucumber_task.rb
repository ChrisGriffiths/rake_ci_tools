namespace :cucumber do
    desc "Task description"
    task :run, [:features] do |_ , args|
        Cucumber::Rake::Task.new(:features) 
        # do |t|
        #     t.cucumber_opts = "--format pretty"
        # end
    end
end