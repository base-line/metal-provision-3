# metal-provision-3
Metal device with Elastic IP

## Table of Contents
- [Pre-requirement](#pre-requirements)
- [Usage](#usage)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Pre-requirements

↥ [back to top](#table-of-contents)

- [Terraform](https://www.terraform.io/downloads.html)
- [Vagrant](https://www.vagrantup.com/downloads)

## Usage

↥ [back to top](#table-of-contents)

create infrastructure

```bash
git clone git@github.com:base-line/metal-provision-3.git
cd metal-provision-3
terraform apply
```

destroy infrastructure

```bash
terraform destroy
```

### API

request Elastic IP

```bash
vagrant@metal-cli-3:/vagrant$ metal ip request --facility ams1 --project-id "<project-id>" --quantity 1 --type public_ipv4
```


## Providers

↥ [back to top](#table-of-contents)

| Name | Version |
|------|---------|
| <a name="provider_metal"></a> [metal](#provider\_metal) | 3.2.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

↥ [back to top](#table-of-contents)

| Name | Source | Version |
|------|--------|---------|
| <a name="module_device"></a> [device](#module\_device) | git::github.com/andrewpopa/terraform-metal-device.git | n/a |
| <a name="module_ip"></a> [ip](#module\_ip) | git::git@github.com:andrewpopa/terraform-metal-reserved-ip-block.git | n/a |
| <a name="module_key"></a> [key](#module\_key) | git::github.com/andrewpopa/terraform-metal-project-ssh-key | n/a |

## Resources

↥ [back to top](#table-of-contents)

| Name | Type |
|------|------|
| [metal_bgp_session.this](https://registry.terraform.io/providers/equinix/metal/latest/docs/resources/bgp_session) | resource |
| [metal_ip_attachment.this](https://registry.terraform.io/providers/equinix/metal/latest/docs/resources/ip_attachment) | resource |
| [template_file.this](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

↥ [back to top](#table-of-contents)

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | description | `string` | `""` | no |
| <a name="input_facility"></a> [facility](#input\_facility) | facility | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | project id | `string` | `""` | no |
| <a name="input_quantity"></a> [quantity](#input\_quantity) | quantity ip | `string` | `""` | no |

## Outputs

↥ [back to top](#table-of-contents)

| Name | Description |
|------|-------------|
| <a name="output_access_public_ipv4"></a> [access\_public\_ipv4](#output\_access\_public\_ipv4) | public ipv4 |
| <a name="output_connection"></a> [connection](#output\_connection) | n/a |
| <a name="output_elastic_ip"></a> [elastic\_ip](#output\_elastic\_ip) | elastic ip |