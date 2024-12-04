# MARIO-BROS
Create EKS cluster using Terraform

# PROJECT MARIO BROS

## Project  Workflow
Step 1 : Login and basics setup

Step 2 : Setup Docker ,Terraform ,aws cli , and Kubectl

Step 3 : IAM Role for EC2

Step 4 : Attach IAM role with your EC2

Step 5 : Building Infrastructure Using terraform

Step 6 : Creation of deployment and service for EKS



### Step 1 : Login  and  basics  setup
1. Click on launch Instance
   

2. Connect to EC2-Instance
   

5. Attach role to ec2 instance

### Step 2 : Setup  Tools

````
sudo apt update -y
````
Setup  Docker :
````
sudo apt install docker.io -y
sudo systemctl start docker
sudo usermod -aG docker ubuntu
newgrp docker
docker --version
````
Setup Terraform :
````
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
terraform --version

````
Setup  AWS CLI :
````
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip 
unzip awscliv2.zip
sudo ./aws/install
aws --version

````

## Install kubectl
Download the latest release with the command:
````
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
````
Validate the binary 
````
 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
````
Validate the kubectl binary against the checksum file:
````
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
````
Install kubectl:
````
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
````
Note:
If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:
````
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
````
````
kubectl version --client
````
### Step 3 : IAM  Role  for  EC2
create role:
![atach iamrole](https://github.com/user-attachments/assets/e4cbfd73-af93-45e5-bc87-3a659fb2fa90)

### Step 4 : Attach  IAM  role  with your  EC2 
go to EC2 
click on actions → security → modify IAM role option
- administrator access
- eks

![iam role1](https://github.com/user-attachments/assets/60016286-2323-43db-bcc8-2beae43f10b1)

![iam role1](https://github.com/user-attachments/assets/0600b53e-25b9-49eb-bb29-75ed9720b00e)

![iam policies for mariodb role project](https://github.com/user-attachments/assets/513768ee-6855-411d-be76-48bec7ba2ef0)

### Step 5 : Building Infrastructure  Using  terraform
Install  GIT
````
sudo apt install git -y
git clone https://github.com/TejalSamarth/MARIO-BROS.git
cd Project-Super-Mario
cd EKS-TF
vim backend.tf
````

Create \ Infra :
````
terraform init
terraform plan
terraform apply --auto-approve
````

````
aws eks update-kubeconfig --name EKS_CLOUD --region ap-southeast-1 --profile eks
````

### Step 6 : Creation  of  deployment  and service  for  EKS
change the directory where deployment and service files are stored use the command →
````
cd ..
````
create  the  deployment :
````
kubectl apply -f deployment.yaml
````
Now create  the service :
````
kubectl apply -f service.yaml
kubectl get all
kubectl get svc mario-service
````
copy the load balancer ingress and paste it on browser and your game is running

![copy lb ingress](https://github.com/user-attachments/assets/3721fdf2-136b-4b81-a062-4a2a2973c0de)


###Final Output: Enjoy The Game 

![enjoy the game](https://github.com/user-attachments/assets/0d886818-33e9-4670-a6be-2ab23d4b1992)

**Delete Infra**
````
 terraform destroy -auto-approve
````

