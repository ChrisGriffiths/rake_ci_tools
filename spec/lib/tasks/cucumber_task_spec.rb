require 'spec_helper'

describe "Test Cucumber Rakefile" do
    before(:each) do
        Cucumber::Rake::Task.stub(:new)
    end

    after(:each)do
        Rake.application.in_namespace(:cucumber){|x|
          x.tasks.each{|task| task.reenable}
        }
    end

    it "should call cucumber" do        
        expect(Cucumber::Rake::Task).to receive(:new)
    
        Rake::Task["cucumber:run"].invoke
    end

    it "should call cucumber without parameters calls defaults" do
        
        cucumber_process = double(Cucumber::Rake::Task::InProcessCucumberRunner)
        cucumber_process.should_receive(:run)

        cucumber_mock = double(Cucumber::Rake::Task)
        cucumber_mock.should_receive(:fork=).with(false)
        cucumber_mock.should_receive(:runner).and_return(cucumber_process)

        expect(Cucumber::Rake::Task).to receive(:new).and_yield(cucumber_mock)
       
        Rake::Task["cucumber:run"].invoke
    end

    it "should call cucumber with feature path" do
        feature_path = 'sample/path'

        cucumber_process = double(Cucumber::Rake::Task::InProcessCucumberRunner)
        cucumber_process.should_receive(:run)

        cucumber_mock = double(Cucumber::Rake::Task)
        cucumber_mock.should_receive(:fork=).with(false)
        cucumber_mock.should_receive(:cucumber_opts=).with(feature_path)
        cucumber_mock.should_receive(:runner).and_return(cucumber_process)

        expect(Cucumber::Rake::Task).to receive(:new).and_yield(cucumber_mock)
        Rake::Task["cucumber:run"].invoke(feature_path)
    end

    it "should call cucumber with profile" do
        profile_key = 'sample_profile'

        cucumber_process = double(Cucumber::Rake::Task::InProcessCucumberRunner)
        cucumber_process.should_receive(:run)

        cucumber_mock = double(Cucumber::Rake::Task)
        cucumber_mock.should_receive(:fork=).with(false)
        cucumber_mock.should_receive(:profile=).with(profile_key)
        cucumber_mock.should_receive(:runner).and_return(cucumber_process)
        
        expect(Cucumber::Rake::Task).to receive(:new).and_yield(cucumber_mock)       

        Rake::Task["cucumber:profile"].invoke(profile_key)
    end

    it "should throw ArgumentError when no profile set" do
        expect{Rake::Task["cucumber:profile"].invoke}.to raise_error(ArgumentError)
    end

    it "should set feature location with set" do
        profile_key = 'sample_profile'
        feature_path = "feature/path"
        
        cucumber_process = double(Cucumber::Rake::Task::InProcessCucumberRunner)
        cucumber_process.should_receive(:run)
        
        cucumber_mock = double(Cucumber::Rake::Task)
        cucumber_mock.should_receive(:fork=).with(false)
        cucumber_mock.should_receive(:profile=).with(profile_key)
        cucumber_mock.should_receive(:cucumber_opts=).with(feature_path)
        cucumber_mock.should_receive(:runner).and_return(cucumber_process) 
        

        expect(Cucumber::Rake::Task).to receive(:new).and_yield(cucumber_mock)
        
        Rake::Task["cucumber:profile"].invoke(profile_key,feature_path)
    end
end