
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

