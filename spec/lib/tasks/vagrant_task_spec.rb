require "spec_helper"

describe "Test Vagrant Rake" do
   before(:each) do
        Vagrant.stub(:build)
    end
    after(:each)do
    ENV['FEATURE_LIST'] = nil
        Rake.application.in_namespace(:vagrant){|x|
          x.tasks.each{|task| task.reenable}
        }
    end

    it "should call ios_cucumber tests with FEATURE_LIST ENV" do
        ENV['FEATURE_LIST'] = "./SampleLocation"

        task_array = ['bundle', 'rake setup', 'rake build', "rake cucumber:profile['ios','./SampleLocation']"]

        expect(Vagrant).to receive(:task).with(task_array)

        Rake::Task["vagrant:ios_cucumber_tests"].invoke
    end

    it "should call ios_cucumber tests with all Files when multiple defined in FEATURE_LIST ENV" do
        ENV['FEATURE_LIST'] = "./SampleLocation ./SampleLocation1"

        task_array = ['bundle', 'rake setup', 'rake build', "rake cucumber:profile['ios','./SampleLocation ./SampleLocation1']"]

        expect(Vagrant).to receive(:task).with(task_array)

        Rake::Task["vagrant:ios_cucumber_tests"].invoke
    end

    it "should pass empty string when FEATURE_LIST ENV is not defined" do
        task_array = ['bundle', 'rake setup', 'rake build', "rake cucumber:profile['ios']"]

        expect(Vagrant).to receive(:task).with(task_array)

        Rake::Task["vagrant:ios_cucumber_tests"].invoke
    end
end