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

output "buckets" {
  value       = { for k, v in google_storage_bucket.quortex : k => v.name }
  description = "A map of bucket names for each bucket provided in variables."
}

# The service account key to use for buckets access.
output "sa_key" {
  value       = length(google_service_account_key.quortex) == 1 ? google_service_account_key.quortex[0].private_key : null
  description = "The service account key to use for buckets access."
  sensitive   = true
}
