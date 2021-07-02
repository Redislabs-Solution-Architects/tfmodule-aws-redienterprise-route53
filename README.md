# Terraform to setup DNS for Redis Enterprise



Example usage:

```
module "dns" {
  region            = "us-west-1"
  profile           = "redislabs"
  source            = "git::ssh://git@github.com/Redislabs-Solution-Architects/tfmodule-aws-redienterprise-route53.git"
  zone-name         = "redisdemo.com"
  cluster-prefix    = "reallybadidea"
  tester-records    = ["192.168.9.1"]
  node-external-ips = ["192.168.9.21", "192.168.9.23", "192.168.0.25"]
}
```

If tester-records is set a tester-$cluster-prefix-$zone-name record will be created.
This is mainly used for a node to run memtier benchmark
