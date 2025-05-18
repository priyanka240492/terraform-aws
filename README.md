# terraform-aws-s3-bucket:
To provision an AWS S3 bucket using Terraform, integrated with GitHub Actions for CI/CD automation.

```
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
└── .github
    └── workflows
        └── terraform.yml
```

---

## GitHub Secrets Setup

To allow GitHub Actions to authenticate with AWS, you need to configure GitHub Secrets with your AWS credentials:

1. Navigate to the **AWS Console → IAM → Users → \[Your User] → Security Credentials → Create access key → Programmatic access**.

   * Copy the **Access Key ID** and **Secret Access Key**.

2. In your GitHub repository:

   * Go to **Settings → Secrets and variables → Actions → New repository secret**.
   * Add the following secrets:

| Secret Name             | Description                |
| ----------------------- | -------------------------- |
| `AWS_ACCESS_KEY_ID`     | Your AWS Access Key ID     |
| `AWS_SECRET_ACCESS_KEY` | Your AWS Secret Access Key |

---

## (Optional) Test the Secrets

To validate, you can add a quick step in your GitHub Action to test AWS CLI connectivity:

```yaml
- name: Test AWS CLI
  run: aws s3 ls
```
---

## Workflow Explanation
The GitHub Actions workflow performs the following Terraform commands in sequence:

Terraform Init — Initializes the working directory.\
Terraform Validate — Validates the configuration files.\
Terraform Plan — Creates an execution plan.\
Terraform Apply — Applies the changes if it's a push event.
