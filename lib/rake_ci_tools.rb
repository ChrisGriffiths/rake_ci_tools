base_path = File.join(File.dirname(__FILE__),'rake_ci_tools')

require 'rake'

require File.join(base_path, 'rake', 'sh')

require File.join(base_path, 'tasks', 'cucumber_task')
require File.join(base_path, 'tasks', 'xcode_task')
require File.join(base_path, 'tasks', 'vagrant_task')
require File.join(base_path, 'tasks', 'calabash_task')
require File.join(base_path, 'tasks', 'deploy_tasks')


require File.join(base_path, 'rake', 'xcode')
require File.join(base_path, 'rake', 'vagrant')
require File.join(base_path, 'rake', 'calabash')
require File.join(base_path, 'rake', 'deploy')

# Include all rake rb files in tasks folders.
# Dir.glob('lib/rake/*.rb').each { |r| import r }
