## 🧪 Labs

Track your progress by checking the boxes for each lab.

### Prerequisites

Ensure you have the following prerequisites in place before starting:
1. [ ] Create a Storage Account for the Terraform State file using [create-terraform-storage.sh](./exercise/create-terraform-storage.sh) from the pipeline (in a separate task).
2. [ ] An active Azure Subscription.
3. [ ] Access to Azure DevOps or GitHub Actions for CI/CD pipeline.
4. [ ] Service Connection to the Azure Subscription in Azure DevOps or GitHub Actions.
5. [ ] An active repository in Azure DevOps or GitHub Actions.

### Main Sections

0. **Terraform** - Test with [vnet tf files](./exercise/Terraform/vnet/)
    - [ ] Execute the Terraform configuration files from your local machine.
    - [ ] Create a basic pipeline to execute it from Azure DevOps or GitHub Actions.

1. **Terraform** - Create the following Azure cloud services (test locally before deploying from Azure DevOps or GitHub Actions):
    - [ ] Create an Azure Resource Group.
    - [ ] Create an Azure Virtual Network (VNET) - Example available in [azure-vnet](./exercise/Terraform/vnet/).
    - [ ] Create a Log Analytics Workspace.
    - [ ] Create a Windows 2022 DC Virtual Machine.
    - Use one module from Microsoft verified modules [Link](https://azure.github.io/Azure-Verified-Modules/).

2. **Develop The Modules** - Create all mentioned Terraform Modules:
    - [ ] Test the modules locally before deploying them from Azure DevOps or GitHub Actions.
    - [ ] Maintain the same structure as the example in the repository [Link](./exercise/Terraform/DevOps_Project/).

3. **Develop CI/CD Pipeline** - Create a CI/CD pipeline for the Terraform modules:
    - [ ] Create a single pipeline with three stages:
        - [ ] Terraform validate - Run Terraform Validate to ensure the code is correct and ready to deploy.
        - [ ] Terraform plan - Run Terraform Plan to preview the resources that will be created.
        - [ ] Terraform apply - Run Terraform Apply to create the resources in Azure.

4. **Automated Testing** - Ensure code quality:
    - [ ] Install and run [Checkov](https://github.com/bridgecrewio/checkov/) - A static code analysis tool for infrastructure-as-code.
    - [ ] Update the first stage to run Checkov - Add Checkov to the first stage of the pipeline to ensure code quality.
    - [ ] [Learn More](https://medium.com/@williamwarley/ensuring-iac-security-with-checkov-a-practical-integration-guide-for-azure-devops-gitlab-and-cc8bcfa3d3e9).

## 🎓 Learning Checkpoints

Test your understanding after each section:

```markdown
- [ ] Can you explain why we're using a remote state for Terraform?
- [ ] Why is automated testing crucial in a DevOps pipeline?
- [ ] How does CI/CD improve the deployment process?
- [ ] What are the benefits of using Terraform modules?
- [ ] How does Checkov enhance the security of your infrastructure-as-code?
- [ ] What is the purpose of the Terraform validate command?
- [ ] Why is it important to test Terraform configurations locally before deploying them through a CI/CD pipeline?
```

## Conclusion

By following this tutorial, you'll not only deploy an example app on Azure but also gain valuable insights into modern DevOps practices and tools.

Embark on this journey to transform your organization into a lean, agile, and competitive force in the digital landscape. Happy deploying! 🚀🔧
