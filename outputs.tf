output "backend_config" {
  value = <<EOT
    backend "s3" {
      key = "tfstate"
      bucket = "${var.bucket_name}"
      region = "${var.region}"
      endpoint = "obs.eu-de.otc.t-systems.com"
      skip_region_validation = true
      skip_credentials_validation = true
      encrypt = true
      kms_key_id = "arn:aws:kms:eu-de:${var.kms_domain_id}:key/${var.kms_key_id}"
    }
  EOT
}