require 'rspec'
require "./lib/rake_ci_tools"

describe 'Testing Xcode Class' do
    before(:each) do
        XCode.stub(:sh)
    end

    it 'build project using all parameters' do
        workspace = 'workspace'
        scheme = 'scheme'
        config = 'config'   
        sdk = 'sdk'
        build_dir = 'dir'

        XCode.should_receive(:sh).with("xcodebuild  -workspace #{workspace} -scheme '#{scheme}' -configuration '#{config}' -sdk #{sdk} CONFIGURATION_BUILD_DIR=#{build_dir}")
           
        XCode.build(workspace,scheme,config,sdk,build_dir)
    end

    build_case = [
        {:test_name =>'workspace', :workspace => nil, :scheme => '', :config => '', :sdk =>'', :build_dir=>''},
        {:test_name => 'scheme', :workspace => '', :scheme => nil, :config => '', :sdk =>'', :build_dir=>''},
        {:test_name => 'config', :workspace => '', :scheme => '', :config => nil, :sdk =>'', :build_dir=>''},
        {:test_name => 'sdk', :workspace => '', :scheme => '', :config => '', :sdk => nil, :build_dir=>''},
        {:test_name => 'build_dir', :workspace => '', :scheme => '', :config => '', :sdk => '', :build_dir=>nil}
    ]

    build_case.each do |input|
        it "build project passing nil #{input[:test_name]} throws error" do
            expect { XCode::build(input[:workspace],input[:scheme],input[:config],input[:sdk],input[:build_dir])}.to raise_error(ArgumentError)
        end
    end

    it 'build and test project using all parameters' do
        workspace = 'workspace'
        scheme = 'scheme'
        config = 'config'
        destination = 'destination'

        XCode.should_receive(:sh).with("xcodebuild test -workspace #{workspace} -scheme '#{scheme}' -configuration '#{config}' -destination '#{destination}'")
           
        XCode::build_and_test(workspace,scheme,config,destination)
    end

    build_and_test_case = [
        {:test_name =>'workspace', :workspace => nil, :scheme => '', :config => '', :destination =>''},
        {:test_name => 'scheme', :workspace => '', :scheme => nil, :config => '', :destination =>''},
        {:test_name => 'config', :workspace => '', :scheme => '', :config => nil, :destination =>''},
        {:test_name => 'destination', :workspace => '', :scheme => '', :config => '',:destination =>nil}
    ]

    build_and_test_case.each do |input|
        it "build project passing nil #{input[:test_name]} throws error" do
            expect { XCode::build_and_test(input[:workspace],input[:scheme],input[:config],input[:destination])}.to raise_error(ArgumentError)
        end
    end

    it "should achieve project using all parameters" do
        scheme = 'scheme'
        profile = 'sample_profile'
        configuration = 'sample_config'
        destination = 'output'

        XCode.should_receive(:sh).with("ipa build --clean --archive --scheme #{scheme} --configuration #{configuration} --embed #{profile} --destination #{destination}")
        
        XCode::archive(scheme,profile,configuration,destination)
    end

    archive_cases = [        
        {:test_name => 'scheme', :scheme => nil, :profile => '', :configuration => '', :destination =>''},
        {:test_name => 'profile', :scheme => '', :profile => nil, :configuration => '', :destination =>''},
        {:test_name => 'configuration', :scheme => '', :profile => '', :configuration => nil, :destination =>''},
        {:test_name => 'destination', :scheme => '', :profile => '', :configuration => '', :destination =>nil}
    ]

    build_and_test_case.each do |input|
        it "should archive project passing nil #{input[:test_name]} throws error" do
            expect { XCode::archive(input[:scheme],input[:profile],input[:configuration],input[:destination])}.to raise_error(ArgumentError)
        end
    end
end