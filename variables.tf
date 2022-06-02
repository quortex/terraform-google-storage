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

variable "project_id" {
  type        = string
  description = "The GCP project in which to create the resources (buckets and service account)."
}

variable "location" {
  type        = string
  description = "The location in wich to create buckets. Storage location documentation here https://cloud.google.com/storage/docs/locations"
}

variable "buckets" {
  type        = set(string)
  default     = []
  description = "The list of buckets to create."
}

variable "storage_prefix" {
  type        = string
  default     = "quortex"
  description = "A prefix for bucket names and service account id. Bucket names will be computed from this prefix and the provided buckets variable."
}

variable "storage_class" {
  type        = string
  default     = "STANDARD"
  description = "The Storage Class of the new buckets."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
}

variable "sa_role" {
  type        = string
  default     = "roles/storage.objectAdmin"
  description = "The role to assign to bucket's service account."
}

variable "labels" {
  type        = map(any)
  description = "Labels to apply to resources. A list of key->value pairs."
  default     = {}
}

variable "action" {
  type        = string
  description = "Bucket lifecycle action."
  default     = "Delete"
}

variable "age" {
  type        = number
  description = "Minimum age of an object in days to satisfy this condition"
  default     = 2
}