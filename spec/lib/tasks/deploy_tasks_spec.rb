require 'spec_helper'

describe "Test Deploy Rakefile" do
    it "should call deploy flight with all parameters" do
        ipa_location = 'ipa_location'
        api_token = 'api_token'
        team_token = 'team_token'

        expect(Deploy).to receive(:sh).with("ipa distribute:testflight -a #{api_token} -T #{team_token} -f #{ipa_location} --notify")

        Rake::Task["deploy:test_flight"].invoke(ipa_location,api_token,team_token)
    end
end