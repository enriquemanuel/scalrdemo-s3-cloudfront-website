provider "aws" {
    region = "us-east-1"
}

module "s3-bucket" {
	source  = "enriquemanuel.scalr.io/env-tp22m4rk1ci4a0o/s3-bucket/aws"
	version = "2.11.1"

  bucket = "scalr-demo"
}


module "cloudfront_s3_website_without_domain" {
   	source  = "enriquemanuel.scalr.io/env-tp22m4rk1ci4a0o/cloudfront-s3-website/aws"
    version                = "1.2.2"
    domain_name            = module.s3_bucket.s3_bucket_id // Any random identifier for s3 bucket name
    use_default_domain     = true
    upload_sample_file     = true
}