namespace :xcode do
    desc "Xcode Build"
    task :build, [:workspace, :scheme, :configuration, :sdk, :buildDir]  do |task, args| 
        args.with_defaults(:sdk => 'iphonesimulator', :buildDir => 'ci-artifacts')
        XCode::build(args[:workspace],args[:scheme],args[:configuration],args[:sdk],args[:buildDir])
    end

    desc "Xcode Test"
    task :build_test, [:workspace, :scheme, :configuration, :destinations] do |task, args| 
        XCode::build_and_test(args[:workspace],args[:scheme],args[:configuration],args[:destinations])     
    end
end