# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "neptune_endpoint" {
  description = "The connection endpoint for the Neptune DB instance"
  value       = aws_neptune_cluster_instance.example.endpoint
}

output "neptune_reader_endpoint" {
  description = "The reader endpoint for the Neptune DB instance"
  value       = aws_neptune_cluster.example.reader_endpoint
}