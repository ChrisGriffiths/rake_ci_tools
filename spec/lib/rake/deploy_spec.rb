require "spec_helper"

describe "Test Deploy" do

    build_case = [
        {:test_name =>'ipa_location', :ipa_location => nil, :api_token => '', :team_token => ''},
        {:test_name =>'api_token', :ipa_location => '', :api_token => nil, :team_token => ''},
        {:test_name =>'team_token', :ipa_location => nil, :api_token => '', :team_token => nil}
    ]

    build_case.each do |input|
        it "deploy to testflight passing nil #{input[:test_name]} throws error" do
            expect { Deploy.deploy_to_testflight(input[:ipa_location], input[:api_token], input[:test_name])}.to raise_error(ArgumentError)
        end
    end
end