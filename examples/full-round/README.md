# Full round Example

A  full example with the token generation. 

>  It's required a load balancer.  

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

4. You need to retrieve the load balancer external IP: 

```shell
KUBECONFIG=./config kubectl get services -n argo-sytem
```

5. Create a `terrafom.tfvars` with the following content:

````hcl
ARGOCD_URL = "<load-balancer-ip>.nip.io"
````

6. Run Terraform again:

```shell
terraform apply
```

