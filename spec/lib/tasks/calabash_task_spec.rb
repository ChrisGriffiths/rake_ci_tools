require 'spec_helper'

describe "Test Calabash Rakefile" do
    before(:each) do
        Calabash_Runner.stub(:sh)
    end
    after(:each) do
        Rake.application.in_namespace(:calabash){|x|
          x.tasks.each{|task| task.reenable}
        }
    end

    it "should call calabash reset simulator" do
        expect(Calabash_Runner).to receive(:sh).with("calabash-ios sim reset")

        Rake::Task['calabash:reset_simulator'].invoke
    end

    it "should call enable accessibility on simulator" do
        expect(Calabash_Runner).to receive(:sh).with("calabash-ios sim acc")

        Rake::Task['calabash:enable_accessibility'].invoke
    end

    it "should disable location dialog on simulator" do
        bundle_id = "com.sample.id"
        
        expect(Calabash_Runner).to receive(:sh).with("calabash-ios sim location on #{bundle_id}")
        
        Rake::Task['calabash:disable_location_dialog'].invoke(bundle_id)
    end

    it "should quit simulator" do
        Calabash::Cucumber::SimulatorAccessibility.stub(:quit_simulator)
        
        expect(Calabash_Runner).to receive(:sh).with("/usr/bin/osascript -e 'tell app \"iPhone Simulator\" to quit'")
        
        Rake::Task['calabash:close_simulator'].invoke
    end
end
