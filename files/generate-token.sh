#!/bin/bash
set -e
set +x

# Test JQ
test -f $(which jq) || error_exit "jq command not detected in path, please install it"

# Get Query VARS from TERRAFORM  and initialize ARGO_HOSTNAME, ARGO_ADMIN_PASSWORD and ARGO_SERVICE_ACCOUNT env
eval "$(jq -r '@sh "export ARGO_ADMIN_PASSWORD=\(.argo_password) ARGO_HOSTNAME=\(.argo_hostname) ARGO_SERVICE_ACCOUNT=\(.argocd_service_account)"')"

# Create bearer token
ARGO_REPONSE=$(curl -k --fail --location --request POST "$ARGO_HOSTNAME/api/v1/session" \
--header 'Content-Type: application/json' \
--data-raw '{
    "username": "admin",
    "password": "'"$ARGO_ADMIN_PASSWORD"'"
}') || \
# Error Message
(echo "Fail to retreive bearer token. Please check if $ARGO_HOSTNAME is a valid endpoint" >&2; exit 1)

# Parse responge to get bearer token
ARGO_AUTH_BEARER_TOKEN=$(echo $ARGO_REPONSE | jq -r '.token')

# Create Service Accout Token  $ARGO_SERVICE_ACCOUNT
ARGO_REPONSE=$(curl -k --fail --location --request POST "$ARGO_HOSTNAME/api/v1/account/$ARGO_SERVICE_ACCOUNT/token" \
--header "Authorization: Bearer $ARGO_AUTH_BEARER_TOKEN") || \
# Error Message
(echo "Fail to retreive $ARGO_SERVICE_ACCOUNT service token. Please check if $ARGO_SERVICE_ACCOUNT service account is present on ArgoCD" >&2; exit 1)

# Parse responge to get service account token
ARGO_SERVICE_ACCOUNT_TOKEN=$(echo $ARGO_REPONSE | jq -r '.token')

# Create Json response for Terraform
jq -n --arg ARGO_SERVICE_ACCOUNT_TOKEN "$ARGO_SERVICE_ACCOUNT_TOKEN" --arg ARGO_SERVICE_ACCOUNT "$ARGO_SERVICE_ACCOUNT" '{"argo_service_account": $ARGO_SERVICE_ACCOUNT, "argo_token":$ARGO_SERVICE_ACCOUNT_TOKEN}'
