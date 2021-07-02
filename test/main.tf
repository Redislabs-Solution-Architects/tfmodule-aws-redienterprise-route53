provider "aws" {
  region  = var.region
  profile = var.profile
}

module "dns" {
  region            = "us-west-1"
  profile           = "redislabs"
  source            = "../"
  zone-name         = "redisdemo.com"
  cluster-prefix    = "reallybadidea"
  tester-records    = ["192.168.9.1"]
  node-external-ips = ["192.168.9.21", "192.168.9.23", "192.168.0.25"]
}
