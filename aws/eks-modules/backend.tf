terraform {
  backend "s3" {  
    bucket = "terraform-statefile-for-backup"
    dynamodb_table = "terraform-state-lock"
    key    = "eks"
    region = "ap-south-1"
    
  }
}

