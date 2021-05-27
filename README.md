# Encrypted Remote State Bucket

## Usage

```hcl
module "kms" {
  source = "../modules/kms"
  key_name = "terraform-remote-state-key"
  realm = local.tenant_name
}

module "terraform_remote_state_bucket" {
  source  = "victorgetz/obs-tf-state-encrypted/opentelekomcloud"
  bucket_name = "tf-remote-state-${local.stage_name}"
  kms_key_id = module.kms.kms_key_id
  kms_domain_id = module.kms.kms_domain_id
  region = local.tenant_name
}
```
