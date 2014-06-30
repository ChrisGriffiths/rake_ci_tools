module Vagrant
    def self.task(tasks=[], project_location='./')
        begin
            puts "Creating Vagrantbox for Process ID: $$"
            create_box('default')
            copy_file_to_guest(project_location)
            tasks.each { |task| command(task) }
        ensure
            destroy_box('default')
        end
    end

    def self.remoteLocation
        ENV['VAGANT_REMOTE_DEST'] || 'vagrant_build'
    end
    
    #ALL BELOW UNTESTED REFACTOR
    def self.create_box(boxName)
        sh "vagrant up #{boxName} --provision"
    end

    def self.destroy_box(boxName)
        puts "Destorying: #{boxName}"
        begin
            get_file_from_guest('./',"#{remoteLocation}/ci-artifacts",boxName)
        ensure
            sh "vagrant destroy -f #{boxName}"
        end
    end

    def self.command(command)
        sh "vagrant ssh --command \"cd #{remoteLocation} && #{command}\""
    end

     def self.copy_file_to_guest(localLocation, boxName = "")
          serverIp = get_ssh_details(/(?<=HostName ).*/, boxName)
          scp(localLocation,"vagrant@#{serverIp}:#{remoteLocation}", boxName)
    end

    def self.get_file_from_guest(localLocation, boxName = "")
        serverIp = get_ssh_details(/(?<=HostName ).*/,boxName)
        scp("vagrant@#{serverIp}:#{remoteLocation}",localLocation,boxName)
    end

    def self.scp(from, to, boxName="")
        portNum = get_ssh_details(/(?<=Port ).*/,boxName)
        keyPath = get_ssh_details(/(?<=IdentityFile ).*/,boxName)

        puts "PortNum: #{portNum}"
        sh "scp -o 'StrictHostKeyChecking no' -i #{keyPath} -P #{portNum} -r #{from} #{to}"
    end

    def self.get_ssh_details(regex, boxName="")
        response = `vagrant ssh-config #{boxName}`
        return response.match(regex)
    end
end