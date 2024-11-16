# Prerequisite

## Install Python3
```bash
sudo apt update
sudo apt install python3
sudo apt install python3-pip
python3 --version
pip3 --version
```
## Install Ansible
```bash
sudo apt install ansible
ansible --version
```

## Create Google Compute Engine 
```bash
follow steps mentioned inside "terraform-demo/readme.md" file
```

## Update instance_public_ip inside "host.ini" file
```bash
[google_cloud_vm]
162.222.176.187 ansible_ssh_private_key_file=/home/shubh/.ssh/id_rsa ansible_user=shubh
```

# Run Ansible Playbook
`
Execute terraform script from ansible playbook to create VM
`
```bash
cd /home/shubh/projects/ansible-demo
sudo ansible-playbook -i hosts.ini playbook.yml
```
#### Or
`
Run terraform script manually
`
```bash
follow steps mentioned inside "terraform-demo/readme.md" file
```

#### then, 
create a file in remote Google Cloud linux V
```bash
cd /home/shubh/projects/ansible-demo
sudo ansible-playbook -i hosts.ini create_file.yml
```