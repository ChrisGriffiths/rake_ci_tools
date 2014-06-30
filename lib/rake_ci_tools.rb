base_path = File.dirname(__FILE__)

require 'rake'

require File.join(base_path, 'tasks', 'dashboard_task')
require File.join(base_path, 'tasks', 'cucumber_task')
require File.join(base_path, 'tasks', 'xcode_task')

require File.join(base_path, 'rake', 'XCode')

# Include all rake rb files in tasks folders.
# Dir.glob('lib/rake/*.rb').each { |r| import r }
