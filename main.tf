resource "kubernetes_namespace" "argo_namespace" {
  metadata {
    name = var.argocd_namespace
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = kubernetes_namespace.argo_namespace.metadata[0].name
  repository = var.argocd_repository
  chart      = var.argocd_chart
  version    = var.argocd_chart_version
  values     = var.argocd_values_path != "" ? [file(var.argocd_values_path)] : []
}

data "kubernetes_secret" "retreive_argocd_password" {
  depends_on = [helm_release.argocd]

  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = helm_release.argocd.namespace
  }
}

data "external" "generate_argocd_token" {

  program = ["/bin/bash", join("/", [path.module, "files", "generate-token.sh"])]

  query = {
    argo_password          = data.kubernetes_secret.retreive_argocd_password.data["password"]
    argo_hostname          = var.argocd_url
    argocd_service_account = var.argocd_kerberus_service_account
  }
}
