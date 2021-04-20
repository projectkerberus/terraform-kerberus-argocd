output "argocd_password" {
  description = "ArgoCD password"
  value       = module.argocd.argocd_password
}

output "argocd_token" {
  description = "To remove only for debug"
  value       = module.argocd.argocd_token
}
