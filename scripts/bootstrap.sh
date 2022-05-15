# Wait for system auto update completion
i="0"
while [ $i -lt 15 ] 
 do 
 if [ $(fuser /var/lib/dpkg/lock) ]; then 
 # Reset timer if dpkg is locked
    echo "$i" 
    i="0" 
 fi 
 sleep 1 
 i=$[$i+1] 
 done

sudo apt-get -y update
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt install -y ansible

ansible-galaxy collection install kubernetes.core
ansible-galaxy collection install community.kubernetes

ansible-playbook /vagrant/ansible/main.yaml
