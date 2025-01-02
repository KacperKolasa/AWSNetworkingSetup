# Terraform Setup Guide (Windows Edition)

This guide explains how to use Terraform on **Windows** to automatically provision your AWS networking infrastructure. If you’re using macOS or Linux, note that commands and paths may differ slightly.

## Prerequisites
- **Terraform**
- **AWS CLI** (configured with valid credentials)
- (Optional) **Git** to clone this repository

---

## Steps

1. **Clone the repository (if you haven’t already)**:
   ```
   git clone https://github.com/KacperKolasa/AWSNetworkingSetup
   cd AWSNetworkingSetup
   ```

2. **Review & Update Variables**  
   Open and modify all the `main.tf` and `variables.tf` files in each folder in any text editor and adjust any default values (e.g. VPC CIDR, subnet CIDRs, names) to fit your environment.

3. **Initialize Terraform**  
   ```
   terraform init
   ```
   > **Note:** If you get an error about the Terraform command not being recognized, ensure Terraform is added to your system PATH or run it from the folder where `terraform.exe` is located.

4. **Review the Plan**  
   ```
   terraform plan
   ```
   This command shows a preview of the resources and changes Terraform will make. Verify that everything matches your expectations.

5. **Apply the Configuration**  
   ```
   terraform apply
   ```
   Type `yes` when prompted to create the resources.

6. **Verify in AWS Console**  
   Once the process completes, open a web browser and sign in to the AWS Console to confirm your newly created resources.

7. **Destroy (Optional)**  
   When you no longer need the environment, remove all created resources:
   ```
   terraform destroy
   ```
   Again, confirm with `yes` when prompted.

## Additional Resources
- [Terraform Documentation](https://www.terraform.io/docs/)
- [AWS Documentation](https://docs.aws.amazon.com/)

