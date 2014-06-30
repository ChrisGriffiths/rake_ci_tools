base_path = File.dirname(__FILE__)

require 'rake'

require File.join(base_path, 'tasks', 'dashboard_task')
require File.join(base_path, 'tasks', 'cucumber_task')
require File.join(base_path, 'tasks', 'xcode_task')

require File.join(base_path, 'rake', 'XCode')

# Include all rake rb files in tasks folders.
# Dir.glob('lib/rake/*.rb').each { |r| import r }

#Define sh runner
def sh(*cmd, &block)
    if Hash === cmd.last then
      options = cmd.pop
    else
      options = {}
    end
    unless block_given?
      block = lambda { |ok, status|
        ok or fail "Command failed with status (#{status.exitstatus}): [#{cmd.join(" ")}]"
      }
    end
    res = system(*cmd)      
    block.call(res, $?)
end