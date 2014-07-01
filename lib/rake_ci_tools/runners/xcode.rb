module XCode
    def self.build(workspace, scheme, configuration, sdk, build_dir)
        if workspace.nil? || scheme.nil? || configuration.nil? || sdk.nil? || build_dir.nil?
            raise(ArgumentError, "parameters can't be nil") 
        end

        sh "xcodebuild -workspace '#{workspace}' -scheme '#{scheme}' -configuration '#{configuration}' -sdk '#{sdk}' CONFIGURATION_BUILD_DIR=#{build_dir}"
    end

    def self.build_and_test(workspace, scheme, configuration, destination)
        if workspace.nil? || scheme.nil? || configuration.nil? || destination.nil?
            raise(ArgumentError, "parameters can't be nil") 
        end

        sh "xcodebuild test -workspace #{workspace} -scheme '#{scheme}' -configuration '#{configuration}' -destination '#{destination}'"
    end

    def self.archive(workspace, scheme, configuration, sdk, provisioning_profile, build_dir)
        if workspace.nil? || scheme.nil? || provisioning_profile.nil? || configuration.nil? || build_dir.nil?
            raise(ArgumentError, "parameters can't be nil") 
        end

        build(workspace, scheme, configuration, sdk, build_dir)        
        sh "/usr/bin/xcrun -sdk iphoneos PackageApplication -v '#{build_dir}/#{scheme}.app' -o '#{build_dir}/#{scheme}.ipa' --embed '#{provisioning_profile}'"
    end
end
