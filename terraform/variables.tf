variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}


# networking

variable "public_subnet_1_cidr" {
  description = "Public Subnet 1"
  default     = "10.0.1.0/24"
}
variable "private_subnet_1_cidr" {
  description = "Private Subnet 1"
  default     = "10.0.3.0/24"
}
variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1", "us-east-2"]
}

# ecs

variable "ecs_cluster_name" {
  description = "Name"
  default     = "pythonproject"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "docker_image" {
  description = "Docker image adress"
  default     = "<aws-account-id>.dkr.ecr.us-east-2.amazonaws.com/TerraformEcsProject:version1"
}
variable "app_count" {
  description = "Docker container number"
  default     = 2
}
variable "allowed_hosts" {
  description = "domain"
  default     = "test.onur.com"
}


# auto scaling
variable "autoscale_min" {
  description = "Minimum number of EC2"
  default     = "1"
}
variable "autoscale_max" {
  description = "Maximum number of EC2"
  default     = "2"
}
variable "autoscale_desired" {
  description = "Autoscale number of EC2"
  default     = "4"
}

# rds
variable "rds_db_name" {
  description = "dbname"
  default     = "database"
}
variable "rds_username" {
  description = "DB Username"
  default     = "username"
}
variable "rds_password" {
  description = "DB Password"
}
variable "rds_instance_class" {
  description = "instance type"
  default     = "db.t2.micro"
}

# domain

variable "certificate_arn" {
  description = "AWS Certificate"
  default     = "ARN"
}