# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc" {
  description = "AWS VPC"
  default     = "10.213.10.0/24"
}

variable "cluster_identifier" {
  description = "Neptune cluster Identifier"
  default     = "ons-gulao"
}

variable "cluster_instance" {
  description = "AWS Neptune Cluster Instance"
  default     = "ons-graph-instance-gulao-1"
}
