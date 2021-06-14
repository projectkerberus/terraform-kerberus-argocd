# Basic Example

A very simple example with fake data. 

## Usage

1. Put the `KUBECONFIG` file in the same folder of the example with the name `config`.

2. Execute:

```bash
terraform init
terraform plan
terraform apply
```

3. Terraform will fail with the following error:

```shell
Error: failed to execute "/bin/bash":   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: argocd.io
Fail to retreive bearer token. Please check if argocd.io is a valid endpoint
```

This is normal because `argocd.io` defined in the `varaibles.tf` isn't a valid endpoint.

