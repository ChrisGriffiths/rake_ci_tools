namespace :xcode do
    desc "Xcode Build"
    task :build, [:workspace, :scheme, :configuration, :sdk, :buildDir]  do |_, args| 
        args.with_defaults(:sdk => 'iphonesimulator', :buildDir => 'ci-artifacts')
        XCode::build(args[:workspace],args[:scheme],args[:configuration],args[:sdk],args[:buildDir])
    end

    desc "Xcode Test"
    task :build_test, [:workspace, :scheme, :configuration, :destinations] do |_ , args| 
        XCode::build_and_test(args[:workspace],args[:scheme],args[:configuration],args[:destinations])     
    end
    
    desc "Achieve ipa"
    task :archive, [:workspace, :scheme, :configuration, :sdk, :provisioning_profile, :destinations] do |_ , args| 
        XCode::archive(args[:workspace],args[:scheme],args[:configuration],args[:sdk],args[:provisioning_profile],args[:destinations])     
    end
end