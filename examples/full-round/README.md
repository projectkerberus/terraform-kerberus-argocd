# Full Round Example

A full example that deploys ArgoCD and generates a token for the service account. 

>  WARNING: In the `values.yml` we define a load balancer to expose an external IP.

## Usage

1. Put the `KUBECONFIG` file in the same folder of the example with the name `config`.

2. Execute:

```sh
terraform init
terraform plan
terraform apply
```

3. When Terraform fails with the following error:

```shell
Error: failed to execute "/bin/bash":   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: argocd.io
Fail to retreive bearer token. Please check if argocd.io is a valid endpoint
```

4. You need to retrieve the load balancer external IP, you can see it with the following command: 

```shell
kubectl --kubeconfig=./config get services  -A | grep argocd-server
```

5. Create a `terrafom.tfvars` with the following content:

````hcl
ARGOCD_URL = "<load-balancer-ip>.nip.io"
````

6. Run Terraform again:

```shell
terraform apply
```

