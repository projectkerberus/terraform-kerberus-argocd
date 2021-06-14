# Terraform Kerberus Dashboard

Terraform module which deploys ArgoCD on your Kubernetes cluster. 

> This module is part of the [Kerberus Platform](https://github.com/projectkerberus/kerberus-platform)  

## Usage

```hcl
module "kerberus_dashboard" {
  source = "project-kerberus/arcocd/kerberus"

  argocd_url = "https://argo.io/"

  path_kubeconfig = "~/.kube/config"
}
```

## Examples

* [Basic](./exemples/basic)
* [Full-Round](./exemples/full-round)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_external"></a> [external](#requirement\_external) | 2.1.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.3.2 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.1.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | n/a |
| <a name="requirement_jq"></a> [jq](#requirement\_jq) | n/a |
| <a name="requirement_curl"></a> [curl](#requirement\_curl) | n/a |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | 2.1.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.2.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.3.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/2.2.0/docs/resources/release) | resource |
| [kubernetes_namespace.argo_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.3.2/docs/resources/namespace) | resource |
| [external_external.generate_argocd_token](https://registry.terraform.io/providers/hashicorp/external/2.1.0/docs/data-sources/external) | data source |
| [kubernetes_secret.retreive_argocd_password](https://registry.terraform.io/providers/hashicorp/kubernetes/2.3.2/docs/data-sources/secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_chart"></a> [argocd\_chart](#input\_argocd\_chart) | ArgoCD chart name to be installed. | `string` | `"argo-cd"` | no |
| <a name="input_argocd_chart_version"></a> [argocd\_chart\_version](#input\_argocd\_chart\_version) | Specify the exact ArgoCD chart version to install. If this is not specified, the latest version is installed. | `string` | `null` | no |
| <a name="input_argocd_kerberus_service_account"></a> [argocd\_kerberus\_service\_account](#input\_argocd\_kerberus\_service\_account) | The name of the ArgoCD service account for kerberus. | `string` | `"kerberus-dashboard"` | no |
| <a name="input_argocd_namespace"></a> [argocd\_namespace](#input\_argocd\_namespace) | The name of ArgoCD namespace for the Kerberus dashboard. | `string` | `"argo-system"` | no |
| <a name="input_argocd_repository"></a> [argocd\_repository](#input\_argocd\_repository) | Repository URL where to locate the ArgoCD chart | `string` | `"https://argoproj.github.io/argo-helm"` | no |
| <a name="input_argocd_url"></a> [argocd\_url](#input\_argocd\_url) | fqdn for ArgoCD gui | `string` | n/a | yes |
| <a name="input_argocd_values_path"></a> [argocd\_values\_path](#input\_argocd\_values\_path) | ArgoCD helm chart values.yaml path. | `string` | `""` | no |
| <a name="input_path_kubeconfig"></a> [path\_kubeconfig](#input\_path\_kubeconfig) | path kubeconfig | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argocd_password"></a> [argocd\_password](#output\_argocd\_password) | ArgoCD password |
| <a name="output_argocd_token"></a> [argocd\_token](#output\_argocd\_token) | ArgoCD token |

## Authors

The module is maintained by [Kiratech](https://www.kiratech.it/) with help from [these awesome contributors](https://github.com/projectkerberus/terraform-kerberus-dashboard/graphs/contributors).

## License

See [LICENSE](./LICENSE) for full details.