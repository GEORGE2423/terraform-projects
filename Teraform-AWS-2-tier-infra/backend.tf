terraform {

  backend "s3" {

    bucket = "april82023demo"
    key    = "liontech-infra/backend"
    region = "ca-central-1"
  }

}