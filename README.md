#rake_ci_tools

[![Build Status](https://travis-ci.org/ChrisGriffiths/rake_ci_tools.svg?branch=master)](https://travis-ci.org/ChrisGriffiths/rake_ci_tools)

##What is rake_ci_tools
rake_ci_tools contains a number of predefined rake tasks for build and testing xcode projects.

It aims to make it easier for all our projects to share tasks to reduce code duplication and improve maintainility

##Installation

###Gem Installation

Download and install rake_ci_tool with the following.
```
  gem install rake
```

##Usage

###Simple Example

First, you must write a file called "Rakefile" file which contains a reference to **rake_ci_tools**
```
require 'rake_ci_tools"
```

Running the “rake -W” command show all the predefined tasks and input parameters


###Called a rake task with parameters
####Commandline
```
rake xcode:build[workspace,scheme,configuration,sdk,buildDir]
```
####Rake task
```
Rake::Task["xcode:build"].invoke('xcworkspace','scheme','configuration','sdk','buildDir')
```

##Predefined tasks

###XCode
```
rake xcode:archive[workspace,scheme,configuration,sdk,provisioning_profile,destinations] 
rake xcode:build[workspace,scheme,configuration,sdk,buildDir]
rake xcode:build_test[workspace,scheme,configuration,destinations]
```
###Cucumber
```
rake cucumber:profile[profile,features]
rake cucumber:run[features]
```
###Calabash
```
rake calabash:close_simulator
rake calabash:disable_location_dialog[bundle_id]
rake calabash:enable_accessibility
rake calabash:reset_simulator
```
###Vagrant
####Prerequisite
[Vagrant](http://docs.vagrantup.com/v2/installation/index.html) must be installed

Project needs to contain a valid [Vagrantfile](http://docs.vagrantup.com/v2/vagrantfile/index.html)
####cucumber
```
rake vagrant:ios_cucumber_tests
```
Configured to use profile named "ios" 

Creates the vagrant box, copies the working directory then run 3 rake commands

    1. bundle
    2. rake setup
    3. rake build

To use this feature configure your rake file to conform to this format 
