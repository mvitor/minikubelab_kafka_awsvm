sudo apt-get -y update
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt install -y ansible

ansible-galaxy collection install kubernetes.core
ansible-galaxy collection install community.kubernete