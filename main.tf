resource "opentelekomcloud_obs_bucket" "tf_remote_state" {
  bucket   = var.bucket_name
  acl      = "private"
  region   = var.region
  versioning = true
  lifecycle {
    prevent_destroy = true
  }
}

resource "opentelekomcloud_obs_bucket_policy" "only_encrypted" {
  bucket = opentelekomcloud_obs_bucket.tf_remote_state.id
  policy = jsonencode({
    Version = "2008-10-17"
    Statement = [
      {
        Sid = "EnforceEncryption"
        Effect = "Deny"
        Principal = {
          "AWS" : [
            "*"]
        }
        Action = [
          "s3:PutObject"],
        Resource = [
          "arn:aws:s3:::${opentelekomcloud_obs_bucket.tf_remote_state.bucket}/*"]
        Condition = {
          StringNotEquals = {
            "s3:x-amz-server-side-encryption" = [
              "aws:kms"]
          }
        }
      }
    ]
  })
}