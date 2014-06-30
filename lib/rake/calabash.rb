module Calabash_Runner      
    def self.enable_accessibility
        sh 'calabash-ios sim acc'
    end
    
    def self.reset_simulator
        sh 'calabash-ios sim reset'
    end

    def self.sim_location(bundle_id)        
        sh "calabash-ios sim location on #{bundle_id}"
    end

    def self.close_simulator
        sh "/usr/bin/osascript -e 'tell app \"iPhone Simulator\" to quit'"
    end
end