variable "ARGOCD_URL" {
  description = "fqdn for ArgoCD gui"
  type        = string
  default     = "11.111.11.111.nip.io"
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

variable "ARGO_VALUES_PATH" {
  description = "ArgoCD helm chart values.yaml path."
  type        = string
  default     = "./values.yaml"
}