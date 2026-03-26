variable "env" {
  description = " Environment FOR MY INFRASTRUCTURE"
    type        = string
}

variable "bucket_name" {
  
  description = "Name of the S3 bucket for infra"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances for infra app"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type of infra app"
  type        = string
  
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instances for infra app"
  type        = string
  
}

variable "hash_key" {
  description = "Hash key for DynamoDB table"
  type        = string

}

variable "public_key_path" {
  description = "Path to public key"
  type        = string
}