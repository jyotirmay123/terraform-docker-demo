# TFC Getting Started

In this repo, you'll find a quick and easy path to get started using [Terraform Cloud](https://app.terraform.io/) with the [Terraform CLI](https://github.com/hashicorp/terraform).

## What's here?

This repo contains two main things:

1. An example Terraform configuration which provisions some mock infrastructure to a fictitious cloud provider called "Fake Web Services" using the [`fakewebservices`](https://registry.terraform.io/providers/hashicorp/fakewebservices/latest) provider.
1. A [script](./scripts/setup.sh) which automatically handles all the setup required to start using Terraform with Terraform Cloud.

## Requirements

- Terraform 0.13 or higher
- The ability to run a bash script in your terminal
- [`sed`](https://www.gnu.org/software/sed/)
- [`curl`](https://curl.se/)
- [`jq`](https://stedolan.github.io/jq/)

## Usage

### 1. Log in to Terraform Cloud via the CLI

Run `terraform login` and follow the prompts to get an API token for Terraform to use. If you don't have a Terraform Cloud account, you can create one during this step.

### 2. Clone this repo

```sh
git clone https://github.com/hashicorp/tfc-getting-started.git
cd tfc-getting-started
```

### 3. Run the setup script and follow the prompts

```
./scripts/setup.sh
```

Welcome to Terraform Cloud!


# Good to know

- **main.tf**: Entry file is **main.tf**  where most of the configuration has been written.
- **variables.tf**: It contains variables and used in **main.tf** using _var_.
- **terraform.tfvars**: Terraform automatically loads all files which match terraform.tfvars or *.auto.tfvars present in the current directory to populate variables. You can also specify a file to load with the -var-file command line argument.

# Commands

- terraform init
- terraform plan # main.tf
- terraform apply
- terraform apply 'static_ip'
- terraform destroy
- terraform show
- terraform taint <google_compute_instance.vm_instance> # To recreate the instance in the cloud.
- terraform plan -var 'project=<PROJECT_ID>' # Assigning run time value to the variable in **variables.tf**. Can be used with any other tf command.
- Environment variables can also be used to populate variables.
- terraform output # outputs.tf
- terraform refresh

## Assigning maps
- terraform apply -var 'machine_types={ dev = "f1-micro", test = "n1-standard-16", prod = "n1-standard-16" }'
- tf-pAT-KEY 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

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

https://docs.github.com/en/rest/reference/actions#get-a-repository-public-key
