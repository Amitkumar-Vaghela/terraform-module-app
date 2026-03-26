module "dev-infra" {
  source = "./infra-app"

  env            = "dev"
  bucket_name    = "infra-app-bucket-amit"
  instance_count = 1
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-0f559c3642608c138"
  hash_key       = "studentID"

  # path to public key
  public_key_path = "${path.module}/infra-app/terra-key-ec2.pub"
}


module "prd-infra" {
  source = "./infra-app"

  env            = "prd"
  bucket_name    = "infra-app-bucket-amit"
  instance_count = 2
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-0f559c3642608c138"
  hash_key       = "studentID"

  # path to public key
  public_key_path = "${path.module}/infra-app/terra-key-ec2.pub"
}


module "stg-infra" {
  source = "./infra-app"

  env            = "stg"
  bucket_name    = "infra-app-bucket-amit"
  instance_count = 1
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-0f559c3642608c138"
  hash_key       = "studentID"

  # path to public key
  public_key_path = "${path.module}/infra-app/terra-key-ec2.pub"
}