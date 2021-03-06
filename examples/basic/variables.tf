variable "ARGOCD_URL" {
  description = "fqdn for ArgoCD gui"
  type        = string
  default     = "argocd.io"
}

variable "PATH_KUBECONFIG" {
  description = "A path to a kube config file."
  type        = string
  default     = "./config"
}

variable "INSECURE_KUBECONFIG" {
  description = "Whether the server should be accessed without verifying the TLS certificate"
  type        = bool
  default     = false
}