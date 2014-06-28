class XCode
    def  self.build(workspace, scheme, configuration, sdk, build_dir)
        # p workspace,scheme,configuration,sdk,build_dir
        sh "xcodebuild  -workspace #{workspace} -scheme '#{scheme}' -configuration '#{configuration}' -sdk #{sdk} CONFIGURATION_BUILD_DIR=#{build_dir}"
    end

    def self.build_and_test(workspace, scheme, configuration, destination)
    end
end
