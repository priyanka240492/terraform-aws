# terraform-aws-s3-bucket:

This project uses GitHub Actions to run Terraform code from a GitHub-hosted virtual machine (VM), authenticating to AWS via OIDC and storing Terraform state in an AWS S3 bucket instead of Terraform Cloud.

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

## How to configure an OIDC role in AWS for GitHub Actions
1. Create an OIDC Provider in AWS:
    - Go to IAM > Identity Providers > Add provider
    - Choose:
      - Provider type: OpenID Connect
      - Provider URL: https://token.actions.githubusercontent.com
      - Audience: sts.amazonaws.com.
        
<Reference : https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services?versionId=free-pro-team%40latest&productId=apps#adding-the-identity-provider-to-aws>

2. Create an IAM Role for GitHub Actions and attach a trust policy.
3. Attach IAM policies to this role to allow S3 access for state file.

## How to configure Terraform backend as AWS S3 instead of Terraform Cloud
Instead of using Terraform Cloud (remote), store Terraform state in an AWS S3 bucket. To do this, update Terraform backend block in main.tf


## (Optional) GitHub Secrets Setup

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
