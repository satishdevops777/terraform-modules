# terraform-modules
terraform-modules

- In Terraform, a module is simply a collection of .tf files in a directory.
  - The module where you run terraform init/plan/apply is the root module
  - Any module that is called from another module is a child module

### Root Module vs Child Module
| Root Module                        | Child Module                   |
| ---------------------------------- | ------------------------------ |
| Entry point of Terraform execution | Reusable component             |
| Contains backend config            | No backend config              |
| Contains provider config (usually) | Should NOT configure providers |
| Calls child modules                | Does not run directly          |
| Environment-specific               | Generic & reusable             |

### Architecture
```
project/
│
├── main.tf              <-- Root module & Backed  Config
├── variables.tf
├── outputs.tf
│
└── modules/
    ├── vpc/
    │   ├── main.tf      <-- Child module
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── ec2/
        ├── main.tf      <-- Child module
        ├── variables.tf
        └── outputs.tf
```

```
terraform-project/
│
├── environments/
│   ├── dev/
│   │   └── main.tf
│   │
│   ├── stage/
│   │   └── main.tf
│   │
│   └── prod/
│       └── main.tf
│
└── modules/
    ├── vpc/
    ├── ec2/
    ├── rds/
    └── alb/
```
### Different Ways to Source a Module
```
source = "./modules/vpc" # Local
source = "git::https://github.com/company/vpc-module.git" # Git Module
source  = "terraform-aws-modules/vpc/aws" # Terraform Registry
