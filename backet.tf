# Создаем бакет в Object Storage
resource "yandex_storage_bucket" "bucket" {
  #bucket     = "bucket-${random_id.bucket_suffix.hex}"
  bucket     = "bucket-120820025"
  depends_on = [
    yandex_resourcemanager_folder_iam_binding.kms_roles,
    yandex_resourcemanager_folder_iam_binding.storage_roles
  ]
  
  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }
}

# Загружаем картинку в бакет
resource "yandex_storage_object" "example_image" {
  bucket     = yandex_storage_bucket.bucket.bucket
  key        = "example.jpg"
  source     = "example.jpg"
  content_type = "image/jpeg"
  depends_on = [yandex_storage_bucket.bucket]
}


# Создаем сервисный аккаунт для работы с бакетом
resource "yandex_iam_service_account" "bucket_sa" {
  name        = "bucket-service-account"
  description = "Service account for bucket operations"
}

# Назначаем права сервисному аккаунту
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

# Генерируем случайный суффикс для имени бакета
resource "random_id" "bucket_suffix" {
  byte_length = 8
}