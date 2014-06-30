base_path = File.dirname(__FILE__)

require 'rake'

require File.join(base_path, 'tasks', 'cucumber_task')
require File.join(base_path, 'tasks', 'xcode_task')
require File.join(base_path, 'tasks', 'vagrant_task')

require File.join(base_path, 'rake', 'xcode')
require File.join(base_path, 'rake', 'vagrant')

# Include all rake rb files in tasks folders.
# Dir.glob('lib/rake/*.rb').each { |r| import r }
