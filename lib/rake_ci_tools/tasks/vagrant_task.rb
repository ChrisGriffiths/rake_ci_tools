namespace :vagrant do
    task :ios_cucumber_tests do
        
        task_list = []
        task_list << 'bundle'
        task_list << 'rake setup'
        task_list << 'rake build'

        feature_list = ENV['FEATURE_LIST'] || ''

        if feature_list.empty?
            task_list << "rake cucumber:profile['ios']"
        else
            task_list << "rake cucumber:profile['ios','#{feature_list}']"
        end

        Vagrant::task(task_list)
    end
end