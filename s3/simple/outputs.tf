output "s3_bucket_arn" {
  description = "The S3 bucket ARN"
  value       = module.s3.s3_bucket_arn
}

output "s3_bucket_id" {
  description = "The S3 bucket name"
  value       = module.s3.s3_bucket_id
}
