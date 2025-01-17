terraform {
  backend "s3" {
    bucket = "terraform-statefile-for-backup"
    key    = "terraform-statefile-for-backup/eks"
    region = "ap-south-1"
    
  }
}