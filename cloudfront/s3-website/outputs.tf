output "cloudfront_domain" {
  description = "The CloudFront domain name"
  value       = module.cloudfront.cloudfront_distribution_domain_name
}

output "cloudfront_id" {
  description = "The CloudFront ID"
  value       = module.cloudfront.cloudfront_distribution_id
}
