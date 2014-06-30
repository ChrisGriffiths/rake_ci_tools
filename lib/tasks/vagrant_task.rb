namespace :vagrant do
    task :ios_cucumber_tests do
        task_list = []
        task_list << 'bundle'
        task_list << 'rake setup'
        task_list << 'rake build'

        feature_list = ENV['FEATURE_LIST'].split(',')

        features_details = ""
        feature_list.each { |feature| features_details <<feature }
        
        task_list << "rake cucumber:profile['ios','#{features_details}']"

        Vagrant::task(task_list)
    end
end