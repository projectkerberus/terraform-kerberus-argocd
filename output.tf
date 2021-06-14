output "argocd_password" {
  description = "ArgoCD password"
  value       = data.kubernetes_secret.retreive_argocd_password.data["password"]
  sensitive   = true
}

output "argocd_token" {
  description = "ArgoCD token"
  value       = lookup(data.external.generate_argocd_token.result, "argo_token")
  sensitive   = true
}
