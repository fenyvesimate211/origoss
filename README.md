# 1. Preparations
## Generate a Dockerhub Personal access token
- **username:** thisIsAUsername
- **token:** thisIsAToken

## Add these Secrets to your Github repository
github.com/<your_username>/<your_repository>/settings/secrets/actions > Repository secrets

```bash
sudo apt-get install docker && sudo apt install -y python3 python3-pip
sudo apt-get install awscli -y
sudo apt-get install terraform || sudo snap install terraform --classic
```

## Install kubectl
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```

## Set up aws account
```bash
aws configure
```

AWS Access Key ID [None]: AWSAcessKey

AWS Secret Access Key [None]: AWSSecretAccessKey

Default region name [None]: eu-central-1

Default output format [None]: json

## Set up Kubernetes context

kubectl config set-context **context-name** --cluster=**cluster-name** --user=**user-name** --namespace=default

kubectl config use-context arn:aws:eks:eu-central-1:<numbers>:cluster/origoss-cluster


# 2. Build and Deploy

## Build and run the project with Docker
```bash
sudo docker build -t origoss .
sudo docker run -d -p 8080:8080 --name origoss_container origoss
```

## Check the running container
```bash
docker ps
```

## Deploy Kubernetes
```bash
kubectl apply -f deployment.yaml
```

## Deploy to Kubernetes with terraform

```bash
terraform init
terraform apply
```

## Check running pods
```bash
kubectl get pods
```