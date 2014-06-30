module XCode
    def  self.build(workspace, scheme, configuration, sdk, build_dir)
        if workspace.nil? || scheme.nil? || configuration.nil? || sdk.nil? || build_dir.nil?
            raise(ArgumentError, "parameters can't be nil") 
        end

        sh "xcodebuild  -workspace #{workspace} -scheme '#{scheme}' -configuration '#{configuration}' -sdk #{sdk} CONFIGURATION_BUILD_DIR=#{build_dir}"
    end

    def self.build_and_test(workspace, scheme, configuration, destination)
        if workspace.nil? || scheme.nil? || configuration.nil? || destination.nil?
            raise(ArgumentError, "parameters can't be nil") 
        end

        sh "xcodebuild test -workspace #{workspace} -scheme '#{scheme}' -configuration '#{configuration}' -destination '#{destination}'"
    end

    def self.archive(scheme, profile, configuration, destination)
        if scheme.nil? || profile.nil? || configuration.nil? || destination.nil?
            raise(ArgumentError, "parameters can't be nil") 
        end

        sh "ipa build --clean --archive --scheme #{scheme} --configuration #{configuration} --embed #{profile} --destination #{destination}"
    end
end
