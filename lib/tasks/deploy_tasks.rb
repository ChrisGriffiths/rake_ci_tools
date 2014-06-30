namespace :deploy do
    desc "Deploy to TestFlight"
    task :test_flight, :ipa_location, :api_token, :team_token  do |_, args|
        Deploy.deploy_to_testflight(args[:ipa_location], args[:api_token], args[:team_token])
    end
end