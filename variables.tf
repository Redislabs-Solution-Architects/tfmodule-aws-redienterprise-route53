variable "profile" {
  description = "The AWS profile to use"
}

variable "region" {
  description = "The AWS region to run in"
}

variable "zone-name" {
  description = "The name for the DNS zone"
  default     = null
}

variable "cluster-prefix" {
  description = "Cluster prefix"
  default     = null
}


variable "node-external-ips" {
  type        = list(any)
  description = "List of IP address to add as NS records"
  default     = []
}

variable "tester-records" {
  type        = list(string)
  description = "List of IP address of any tester nodes to add"
  default     = []
}
