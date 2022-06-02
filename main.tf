/**
 * Copyright 2020 Quortex
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# google provider configuration
# versions constrints defined in versions.tf
provider "google" {
  project = var.project_id
}

# A service account to use to access to buckets.
resource "google_service_account" "quortex" {
  count      = length(var.buckets) > 0 ? 1 : 0
  account_id = var.storage_prefix == "" ? "quortex-storage" : "${var.storage_prefix}-storage"
}

# A service account key to use to access to buckets.
resource "google_service_account_key" "quortex" {
  count              = length(var.buckets) > 0 ? 1 : 0
  service_account_id = google_service_account.quortex[count.index].name
}

# The GCS buckets.
resource "google_storage_bucket" "quortex" {
  for_each           = var.buckets
  name               = var.storage_prefix == "" ? each.value : "${var.storage_prefix}-${each.value}"
  location           = var.location
  storage_class      = var.storage_class
  force_destroy      = var.force_destroy
  bucket_policy_only = true
  labels             = var.labels

  lifecycle_rule {
    condition {
      age = var.age
    }
    action {
      type = var.action
    }
  }


}

# IAM binding from given role to buckets.
resource "google_storage_bucket_iam_binding" "storage_objectAdmin" {
  for_each = var.buckets
  bucket   = google_storage_bucket.quortex[each.value].name
  role     = var.sa_role

  members = [
    "serviceAccount:${google_service_account.quortex[0].email}",
  ]
}
