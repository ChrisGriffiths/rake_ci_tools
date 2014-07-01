base_path = File.join(File.dirname(__FILE__),'rake_ci_tools')

require 'rake'

require File.join(base_path, 'tasks', 'cucumber_task')
require File.join(base_path, 'tasks', 'xcode_task')
require File.join(base_path, 'tasks', 'vagrant_task')
require File.join(base_path, 'tasks', 'calabash_task')
# require File.join(base_path, 'tasks', 'deploy_tasks')

require File.join(base_path, 'runners', 'sh')
require File.join(base_path, 'runners', 'xcode')
require File.join(base_path, 'runners', 'vagrant')
require File.join(base_path, 'runners', 'calabash')
# require File.join(base_path, 'runners', 'deploy')
