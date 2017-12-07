VAGRANTFILE_API_VERSION = "2"
VM_MEMORY = 4096
VM_CORES = 4
VM_GUI = false

Vagrant.configure("2") do |config|
	config.vm.box = "geerlingguy/ubuntu1604"

	config.vm.define "ubuntu" do |ubuntu|
		ubuntu.vm.box = "ubuntu"
		ubuntu.vm.hostname = 'ubuntu'

		ubuntu.ssh.insert_key = 'true'

		ubuntu.vm.provider :virtualbox do |v|
			v.gui = VM_GUI
			v.cpus = VM_CORES
			v.customize ["modifyvm", :id, "--memory", VM_MEMORY]
			v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
			v.customize ["modifyvm", :id, "--name", "ubuntu"]
		end

		config.vm.provider :vmware_workstation do |v|
			v.gui = VM_GUI
			v.vmx["numvcpus"] = VM_CORES
			v.vmx["memsize"] = VM_MEMORY
			v.vmx["name"] = "ubuntu"
		end

		#ubuntu.vm.provision "shell", path: "envProvision.sh"
		ubuntu.vm.synced_folder ".", "/vagrantShared"
	end

	config.vm.provision :basics, path: "provision.sh"
end