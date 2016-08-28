module DockerSwarm
	    def init(config, itemNumber, ip)
	      # enable swarm manager
	      puts "Check if we need to activate docker-swarm-manager.service on guest #{itemNumber}"
    	  if (itemNumber == 1)
    	  	puts "We need to activate docker-swarm-manager.service on guest #{itemNumber}"
	      	  # install swarm manager
    		  config.vm.provision "shell", run: "once"  do |s|
    		    puts "swarm manager guest ip: " + ip
    		    s.inline = <<-SCRIPT
    		     systemctl enable --runtime docker-swarm-manager.service
    		     echo "swarm manage on etcd://$1:2379/swarm"
    		     echo "e.g. cmd : $ docker -H tcp://$1:port info"
    		    SCRIPT
    		    s.args = "#{ip}"
    		  end
    	  end
     
	    end
end