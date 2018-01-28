# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  machine_names = %w(
    swarm-master
    swarm-node-0
  )

  machine_names.each_with_index do |name, i|
    config.vm.define name do |machine|
      machine.vm.box = "ubuntu/xenial64"
      machine.vm.hostname = name
      machine.vm.network "private_network", ip: "10.100.198.20#{i}"
      machine.vm.provider "virtualbox" do |v|
        v.memory = 1024
      end
    end
  end
end
