require 'calabash-cucumber'

namespace :calabash do

    desc "Reset Simulator Content and Settings"
    task :reset_simulator do
        Calabash_Runner::reset_simulator
    end

    desc "Enable Accessibility On Simulator"
    task :enable_accessibility do
        Calabash_Runner::enable_accessibility
    end

    desc "Disable Location Dialog On Simulator"
    task :disable_location_dialog , :bundle_id do |_,args|
        Calabash_Runner::sim_location(args[:bundle_id])
    end

    desc "Close the Simulator"
    task :close_simulator do
        Calabash_Runner::close_simulator
    end
end
