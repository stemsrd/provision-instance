terraform {
  backend "s3" {
    bucket = "my-test-tf-state-bucket"
    key = "main"
    region = "eu-north-1"
    dynamodb_table = "my-dynamodb-table"
  }
}
