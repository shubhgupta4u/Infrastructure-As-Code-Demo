# Prerequisite

## Install Terraform
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform

terraform -help

```

## Generate GCP Cloud service account json key file
```bash
Open Google Cloud Console
IAM & Admin > Service Accounts.
Create new Service Account
Grant Permission to Service Account 
Create Json key for Service Account
Save it "terraform-demo" folder as "key.json" file
```

## Generate ssh key
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Save ssh key file at default location /home/<username>/.ssh/id_rsa


# Run Terraform 
- Modify ssh file path inside "./modules/instances/main.tf" file.
- Update "variables.tf" file

```bash
cd /home/shubh/projects/terraform-demo
sudo terraform init
sudo terraform apply
```
Copy "instance_public_ip" value for later use to ssh

# ssh Remote google cloud VM 

```bash
ssh -i /home/shubh/.ssh/id_rsa shubh@<instance_public_ip>
ssh -i /home/shubh/.ssh/id_rsa shubh@35.223.152.178
```
