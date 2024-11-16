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

## Create Google Compute Engine 'demo-vm1'
```bash
follow steps mentioned inside "terraform-demo/readme.md" file
```

# Run Ansible Playbook
Create a file in remote Google Cloud linux V
```bash
cd /home/shubh/projects/ansible-demo
ansible-playbook -i hosts.ini create_file.yml
```