require "spec_helper"

describe 'Testing Xcode Rake File' do

  before(:each) do
    XCode.stub(:build)
  end
  
  after(:each)do
    Rake.application.in_namespace(:xcode){|x|
      x.tasks.each{|task| task.reenable}
    }
  end
  
  it 'should call xcode build with all parameters' do

    workspace = 'workspace'
    scheme = 'scheme'
    config = 'config'
    sdk = 'sdk'
    build_dir = 'dir'

    expect(XCode).to receive(:build).with(workspace,scheme,config,sdk,build_dir)
       
    Rake::Task["xcode:build"].invoke(workspace,scheme,config,sdk,build_dir)
  end

  it 'should call xcode build with some default parameters' do

    workspace = 'workspace'
    scheme = 'scheme'
    config = 'config'

    expect(XCode).to receive(:build).with(workspace,scheme, config,'iphonesimulator','ci-artifacts')

    Rake::Task["xcode:build"].invoke(workspace,scheme,config)
  end

  it 'should build and test with all parameters' do
    workspace = 'workspace'
    scheme = 'scheme'
    config = 'config'
    destination = 'sdk'

    expect(XCode).to receive(:build_and_test).with(workspace,scheme,config,destination)
       
    Rake::Task["xcode:build_test"].invoke(workspace,scheme,config,destination)
  end
end
