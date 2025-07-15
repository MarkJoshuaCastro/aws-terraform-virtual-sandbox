# 🚀 AWS VPC + EC2 Terraform Project

This Terraform project provisions a modular AWS infrastructure stack with a custom VPC, public and private subnets, IAM roles, security groups, and EC2 instances. It demonstrates secure cloud networking with S3 access from private instances via IAM instance profiles and VPC endpoints.

---

## 📦 Features

- Custom VPC with CIDR block and internet gateway
- Public and private subnets in one AZ
- NACLs and security groups for layered network security
- IAM role and instance profile for S3 read-only access
- Three EC2 instances (1 public, 2 private)
- VPC endpoint to route S3 traffic without NAT
- Modular Terraform layout for reusability

---

## 🧱 Folder Structure

terraform-project/
├── main.tf                     # Core infrastructure definitions
├── variable.tf                 # Input variables
├── output.tf                   # Output values
├── terraform.tfvars.example    # Sample variable values
├── .gitignore                  # Excludes .terraform/, .tfstate, etc.
├── README.md                   # Project documentation
└── modules/                    # Reusable Terraform modules
    ├── ec2/                    # EC2 instance configurations
    ├── iam/                    # IAM role
    ├── nacl/                   # Network ACLs
    ├── sg/                     # Security Groups
    └── vpc/                    # VPC setup


---

## ⚙️ Usage

1. Copy the example variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Fill in the real values in terraform.tfvars (e.g., AMI ID, key pair, IP).

3. Initialize and deploy:

   terraform init
   terraform plan
   terraform apply

## 🔐 Security Notes

- Your actual terraform.tfvars should never be committed — it's ignored via .gitignore.

- Use terraform.tfvars.example for sharing safe defaults.

## 📚 Prerequisites
- AWS CLI configured with credentials

- SSH key pair uploaded to AWS

- Terraform v1.5+ installed

## 🤝 Contributions
Pull requests and improvements welcome! For feature ideas or bug fixes, feel free to open an issue.

## 📝 License
This project is open-source under the MIT License.

---

Let me know if you'd like to tweak the tone for recruiters, beginners, or team handoff. We can also add deployment diagrams or automate `terraform validate` with GitHub Actions. Your repo's about to look ✨ polished ✨.
