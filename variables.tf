variable "bucket_name" {
  description = "The bucket name where the encrypted tf file should be stored"
}
variable "kms_key_id" {}
variable "kms_domain_id" {}
variable "region" {}