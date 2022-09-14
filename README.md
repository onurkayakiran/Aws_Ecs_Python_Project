# Terraform_ECS_Python

How we can create a Python Hello World project deploy the docker image, how we can push the Amazon ECR and deploy the Amazon ECS. 


### Dockerize the Project

How we can create a Dockerfile and run the same application in Docker.

```
// change directory
cd hello-world-python
// build the image
docker build -t terraform-ecs-project .
// list the image
docker images

```


If you check docker container, run and connect

```
// run the container
docker run -d -p 80:80 --name terraform-ecs-project terraform-ecs-project
// list the container
docker ps
// logs
docker logs terraform-ecs-project
// exec into running container
docker exec -it terraform-ecs-project /bin/sh
```

### Pushing Docker Image to ECR AWScli

Firstly authenticate to your default registry.

```
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin <aws-account-id>.dkr.ecr.us-east-2.amazonaws.com
```

Create a repository with the following command

```
aws ecr create-repository --repository-name rest-api --image-scanning-configuration scanOnPush=true --image-tag-mutability IMMUTABLE --region us-east-2
```

### Tagging local Docker image

Local docker image tagging

```
docker tag TerraformEcsProject:version1 <aws_account>.dkr.ecr.us-east-2.amazonaws.com/TerraformEcsProject:version1
```

Check and Push

```
// list the images
docker images
// push the image
docker push <aws_account>.dkr.ecr.us-east-2.amazonaws.com/TerraformEcsProject:version1
```



### Deploy On AWS ECS

Set some enviroment variables

```
cd terraform
export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"

terraform init
terraform apply
```


Note: If you limit site access to your own IP Adress Edit securitygroups.tf
