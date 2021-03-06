[![Quortex][logo]](https://quortex.io)
# terraform-google-storage
A terraform module for Quortex infrastructure GCP persistent storage layer.

It provides a set of resources necessary to provision the Quortex infrastructure persistent storage on Google Cloud Platform.

This module is available on [Terraform Registry][registry_tf_google_storage].

Get all our terraform modules on [Terraform Registry][registry_tf_modules] or on [Github][github_tf_modules] !

## Created resources

This module creates the following resources in GCP:

- a list of buckets
- a service account with role binding on buckets
- a service account key to access buckets


## Usage example

```hcl
module "storage" {
  source = "quortex/storage/google"

  # Globally used variables.
  project_id = module.network.project_id
  location   = module.network.region

  # Prevent resources names conflicts for multiple workspaces usage.
  storage_prefix = terraform.workspace

  # Buckets configuration.
  buckets       = ["mezzanine", "encoded"]
  force_destroy = true
}
```
---

## Related Projects

This project is part of our terraform modules to provision a Quortex infrastructure for Google Cloud Platform.

![infra_gcp]

Check out these related projects.

- [terraform-google-network][registry_tf_google_network] - A terraform module for Quortex infrastructure network layer.

- [terraform-google-gke-cluster][registry_tf_google_gke_cluster] - A terraform module for Quortex infrastructure GKE cluster layer.

- [terraform-google-load-balancer][registry_tf_google_load_balancer] - A terraform module for Quortex infrastructure GCP load balancing layer.

## Help

**Got a question?**

File a GitHub [issue](https://github.com/quortex/terraform-google-storage/issues) or send us an [email][email].


  [logo]: https://storage.googleapis.com/quortex-assets/logo.webp
  [email]: mailto:info@quortex.io
  [infra_gcp]: https://storage.googleapis.com/quortex-assets/infra_gcp_002.jpg
  [registry_tf_modules]: https://registry.terraform.io/modules/quortex
  [registry_tf_google_network]: https://registry.terraform.io/modules/quortex/network/google
  [registry_tf_google_gke_cluster]: https://registry.terraform.io/modules/quortex/gke-cluster/google
  [registry_tf_google_load_balancer]: https://registry.terraform.io/modules/quortex/load-balancer/google
  [registry_tf_google_storage]: https://registry.terraform.io/modules/quortex/storage/google
  [github_tf_modules]: https://github.com/quortex?q=terraform-