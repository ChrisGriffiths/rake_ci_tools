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

    expect(XCode).to receive(:sh).with("xcodebuild  -workspace #{workspace} -scheme '#{scheme}' -configuration '#{config}' -sdk #{sdk} CONFIGURATION_BUILD_DIR=#{build_dir}")
       
    XCode.build(workspace,scheme,config,sdk,build_dir)
  end
end