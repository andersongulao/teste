# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "cluster_identifier" {
  description = "Neptune cluster Identifier"
  default     = "ons-graph"
}

variable "cluster_instance" {
  description = "AWS Neptune Cluster Instance"
  default     = "ons-graph-instance-1"
}

variable "tag" {
  description = "Tag Solution ONS"
  default = "CapacidadesDigitais"
}

