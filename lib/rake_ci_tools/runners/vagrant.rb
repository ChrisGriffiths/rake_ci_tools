module Vagrant
    def self.task(box_name, tasks=[], project_location='./')
        begin
            puts "Creating Vagrantbox for Process ID: #{Process.pid}"
            create_box(box_name)
            copy_file_to_guest(project_location,box_name)
            tasks.each { |task| command(task,box_name) }
        ensure
            destroy_box(box_name)
        end
    end

    def self.remoteLocation
        ENV['VAGANT_REMOTE_DEST'] || 'vagrant_build'
    end

    def self.artifact_path
        ENV['ARTIFACT_PATH'] || 'ci-artifacts'
    end
    
    #ALL BELOW UNTESTED REFACTOR
    def self.create_box(box_name)
        sh "vagrant up #{box_name} --provision"
    end

    def self.destroy_box(box_name)
        puts "Destorying: #{box_name}"
        begin
            get_file_from_guest("./",box_name)
        ensure
            sh "vagrant destroy -f #{box_name}"
        end
    end

    def self.command(command, box_name)
        sh "vagrant ssh #{box_name} --command \"cd #{remoteLocation} && #{command}\""
    end

     def self.copy_file_to_guest(localLocation, box_name)
          serverIp = get_ssh_details(/(?<=HostName ).*/, box_name)
          scp(localLocation,"vagrant@#{serverIp}:#{remoteLocation}", box_name)
    end

    def self.get_file_from_guest(localLocation, box_name)
        serverIp = get_ssh_details(/(?<=HostName ).*/,box_name)
        scp("vagrant@#{serverIp}:#{remoteLocation}/#{artifact_path}",localLocation,box_name)
    end

    def self.scp(from, to, box_name)
        portNum = get_ssh_details(/(?<=Port ).*/,box_name)
        keyPath = get_ssh_details(/(?<=IdentityFile ).*/,box_name)

        puts "PortNum: #{portNum}"
        sh "scp -o 'StrictHostKeyChecking no' -i #{keyPath} -P #{portNum} -r #{from} #{to}"
    end

    def self.get_ssh_details(regex, box_name)
        response = `vagrant ssh-config #{box_name}`
        return response.match(regex)
    end
end