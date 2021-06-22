variable "argocd_namespace" {
  description = "The name of ArgoCD namespace for the Kerberus dashboard."
  type        = string
  default     = "argo-system"
}

variable "argocd_repository" {
  description = "Repository URL where to locate the ArgoCD chart"
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "argocd_chart" {
  description = "ArgoCD chart name to be installed."
  type        = string
  default     = "argo-cd"
}

variable "argocd_chart_version" {
  description = "Specify the exact ArgoCD chart version to install. If this is not specified, the latest version is installed."
  type        = string
  default     = null
}

variable "argocd_url" {
  description = "fqdn for ArgoCD gui"
  type        = string
}

variable "argocd_values_path" {
  description = "ArgoCD helm chart values.yaml path."
  type        = string
  default     = ""
}

variable "argocd_kerberus_service_account" {
  description = "The name of the ArgoCD service account for kerberus."
  type        = string
  default     = "kerberus-dashboard"
}

variable "argocd_rbacConfig_policy_default" {
  description = "Argo CD pre-defined roles, it can be role:readonly or role:admin. For more information see: https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/rbac.md"
  type        = string
  default     = "role:admin"
}

variable "argocd_server_extra_args" {
  description = "ArgoCD server extra args"
  type        = list(string)
  default     = ["--insecure"]
}

variable "path_kubeconfig" {
  description = "path kubeconfig"
  type        = string
}