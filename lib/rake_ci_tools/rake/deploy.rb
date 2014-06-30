module Deploy
    def self.deploy_to_testflight(ipa_location, api_token, team_token)
        if ipa_location.nil? || api_token.nil? || team_token.nil?
            raise(ArgumentError, "parameters can't be nil") 
        end

        require 'shenzhen'
        sh "ipa distribute:testflight -a #{api_token} -T #{team_token} -f #{ipa_location} --notify"
    end
end