# Scaleway-tf

Simple Terraform configuration for creating a Scaleway VM.

## Getting started

1. Initialize terraform `terraform init`
2. Run plan `terraform plan`
3. Apply `terraform apply`

## Example usage :

```hcl
terraform plan -var='vm_type=COPARM1-2C-8G' -var='name=workspace'
terraform apply -var='vm_type=COPARM1-2C-8G' -var='name=workspace'
```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vm_type | The type of the VM to create | string | n/a | yes |
| name | The name of the VM to create | string | n/a | yes |
| image | The image of the VM to create | string | "ubuntu_focal" | no |


## Outputs

| Name | Description |
|------|-------------|
| ip | The public IP of the VM |
| id | The ID of the VM |
| name | The name of the VM |
| image | The image of the VM |

## Useful resources

* https://registry.terraform.io/providers/scaleway/scaleway/latest/docs
* https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/instance_server.html#additional_volume_ids