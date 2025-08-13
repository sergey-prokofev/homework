resource "yandex_storage_bucket" "my_bucket" {
  bucket     = "my-bucket-${random_id.bucket_name.hex}"
  
  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }

  access_key = yandex_iam_service_account_static_access_key.sa_keys.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_keys.secret_key

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key_1.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}


resource "yandex_kms_symmetric_key" "key_1" {
  name              = "key-1"
  description       = "KMS key for bucket"
  default_algorithm = "AES_256"
  rotation_period   = "24h"
}


resource "yandex_storage_object" "example_image" {
  bucket     = yandex_storage_bucket.my_bucket.bucket
  key        = "example.jpg"
  source     = "example.jpg"
  access_key = yandex_iam_service_account_static_access_key.sa_keys.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_keys.secret_key
  content_type = "image/jpeg"
}





resource "yandex_iam_service_account" "bucket_sa" {
  name        = "bucket-sa"
  description = "service account"
}

resource "yandex_resourcemanager_folder_iam_binding" "kms_roles" {
  folder_id = var.folder_id
  role      = "kms.keys.encrypterDecrypter"
  members   = [
    "serviceAccount:${yandex_iam_service_account.bucket_sa.id}"
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "storage_roles" {
  folder_id = var.folder_id
  role      = "storage.editor"
  members   = [
    "serviceAccount:${yandex_iam_service_account.bucket_sa.id}"
  ]
}

resource "yandex_iam_service_account_static_access_key" "sa_keys" {
  service_account_id = yandex_iam_service_account.bucket_sa.id
  description        = "key for service_account"
}

resource "random_id" "bucket_name" {
  byte_length = 8
}