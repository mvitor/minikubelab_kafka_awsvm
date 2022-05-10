require 'vagrant-aws'
class Hash
   def slice(*keep_keys)
     h = {}
     keep_keys.each { |key| h[key] = fetch(key) if has_key?(key) }
     h
   end unless Hash.method_defined?(:slice)
   def except(*less_keys)
     slice(*keys - less_keys)
   end unless Hash.method_defined?(:except)
 end


Vagrant.configure("2") do |config|
   config.vm.box = "dummy"
   config.vm.provider 'aws' do |aws, override|
      aws.access_key_id =  "AKIAYTZD43YGJTQRTXKJ"
      aws.secret_access_key = ""
      aws.keypair_name = 'macoskeypair'
      aws.ami = "ami-01d272181e2844951"
      #aws.ami = "ami-0f6b4418414fb1c01"
      aws.region = "us-east-1"
      aws.instance_type = "m4.2xlarge"
      aws.security_groups = ['default']
      override.ssh.username  = 'ubuntu'
      override.ssh.private_key_path = '.ssh/macoskeypair.pem'

    end
   config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
   config.vm.provision :shell, privileged: true, path: "scripts/bootstrap.sh"
   config.vm.provision "shell", inline: <<-SHELL
   ansible-galaxy collection install kubernetes.core
   ansible-galaxy collection install community.kubernetes
    SHELL
 end
 
