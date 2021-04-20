provider "kubernetes" {
  config_path = var.PATH_KUBECONFIG
  insecure    = var.INSECURE_KUBECONFIG
}

provider "helm" {
  kubernetes {
    config_path = var.PATH_KUBECONFIG
  }
}

module "argocd" {
  source = "../../"

  argocd_url = var.ARGOCD_URL

  path_kubeconfig = var.PATH_KUBECONFIG
}
 