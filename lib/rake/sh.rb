module Kernel
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
end