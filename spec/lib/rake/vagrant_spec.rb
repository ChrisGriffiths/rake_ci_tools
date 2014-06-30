require "spec_helper"

describe "Test Vagrant" do
    before(:each) do
        Vagrant.stub(:sh)
        Vagrant.stub(:get_file_from_guest)
        Vagrant.stub(:copy_file_to_guest)
    end

    it "should call vagrant up with default" do
        expect(Vagrant).to receive(:create_box).with('default')
        Vagrant::task
    end
    
    it "should call vagrant destroy even when error occurs" do
        expect(Vagrant).to receive(:create_box).with('default').and_raise("Raise Error")
        expect(Vagrant).to receive(:destroy_box).with('default')
        expect {Vagrant.task}.to raise_error("Raise Error")
    end

    it "should copy files from defined location" do
        location = "sample/location"
        expect(Vagrant).to receive(:copy_file_to_guest).with(location)
        Vagrant::task([],location)
    end

    it "should call command with each item in tasks" do
        expect(Vagrant).to receive(:command).with('command1').ordered  
        expect(Vagrant).to receive(:command).with('command2').ordered
        Vagrant.task(['command1','command2'])
    end
end