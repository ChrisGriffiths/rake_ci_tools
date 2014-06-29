require 'spec_helper'
require 'cucumber'
require 'cucumber/rake/task'

describe "Test Cucumber Rakefile" do
    it "should call cucumber" do
        Cucumber::Rake::Task.stub(:new)

        expect(Cucumber::Rake::Task).to receive(:new).with(:features)
    
        Rake::Task["cucumber:run"].invoke
    end

    # it "should call cucumber with feature path" do
    #     feature_path = 'sample/path'

    #     expect(Cucumber).to receive(:run).with(feature_path)
    #     Rake::Task["cucumber:run"].invoke(feature_path)
    # end
end