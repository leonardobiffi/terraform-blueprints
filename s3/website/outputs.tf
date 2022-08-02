output "s3_domain" {
  description = "The S3 domain name"
  value       = module.s3.s3_bucket_bucket_regional_domain_name
}

output "s3_bucket_id" {
  description = "The S3 bucket ID"
  value       = module.s3.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "The S3 bucket ARN"
  value       = module.s3.s3_bucket_arn
}
