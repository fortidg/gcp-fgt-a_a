# GCP Active/Active dual zone FortiGate POC

## How do you run these?

1. Install [Terraform](https://www.terraform.io/).
1. Open `terraform.tfvars.example`Change the name to 'terraform.tfvars' update the required variables (project, region, zone zone2, prefix, fortigate_vm_image, fortigate_machine_type)   
1. Run `terraform get`.
1. Run `terraform init`.
1. Run `terraform plan`.
1. If the plan looks good, run `terraform apply`.

If you use the Pay As You Go (PAYG) image or if you want to use FortiFlex, leave the Fortigate names in terraform.tfvars set as null.  

If you would like use the Bring Your Own License (BYOL) image, please add the license files in the local directory and modify the names  in terraform.tfvars accordingly.  If you leave the names as null for the BYOL instance, you can manually upload the licenses later or use FortiFlex.  Future versions will allow putting FortiFlex tokens in at bootstrap.

If you wish to deploy FortGates in only one zone, you can use the same value for "zone" and "zone2".
