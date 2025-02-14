## 🧪 Labs

[ ] Check boxes have been added to each lab to help you keep track of your progress.

### Prerequisites

Before you start, ensure you have the following [prerequisites] in place
1. [ ] Create a Storage Account for Terraform State file [create-terraform-storage.sh](./exercice/create-terraform-storage.sh)
2. [ ] You need to have Active Azure Subscription
3. [ ] Access to Azure Devops or GitHub Actions for CI/CD pipeline
4. [ ] Service Connection to Azure Subscription in Azure Devops or GitHub Actions
5. [ ] Active Repository in Azure Devops or GitHub Actions


### Main Sections

0. **Terraform** - Test with [vnet tf files](./exercice/Terraform/vnet/)
    - [ ] [Execute the TF config files from your local machine]
    - [ ] [Create basic pipeline to run it from devops/github]

     
1. **Terraform** - Create the following Azure cloud services
    - [ ] [Create Azure Resource Group]
    - [ ] [Create Azure Virtual Network (VNET)] - You have an Terraform example located in [azure-vnet](./exercice/Terraform/vnet/)
    - [ ] [Create Log Analytics Workspace]
    - [ ] [Create Windows 2022 DC Virtual Machine]

2. **Develop The Modules** - Create all Terraform Modules mentioned above
    - [ ] [You can test the modules locally before deploying them from Azure Devops or GitHub Actions]
    - [] [Main the same structure as the example in the repository] [Link](./exercice/Terraform/DevOps_Project/)

2. **Develop CICD pipeline** - Create a CICD pipeline for the Terraform modules
    - [ ] [Create single pipeline with three stages as follows]
        - [ ] [Terraform validate] - To run Terraform Validate and make sure the code is correct and ready to deploy
        - [ ] [Terraform plan] - To run Terraform Plan and see what resources will be created
        - [ ] [Terraform apply] - To run Terraform Apply and create the resources in Azure


4. **Automated Testing** Ensure code quality
    - [ ] [Install And Run Checkov](https://github.com/bridgecrewio/checkov/) - Checkov is a static code analysis tool for infrastructure-as-code
    - [ ] [Update the first Stage to run Checkov] - Add Checkov to the first stage of the pipeline to ensure the code quality
    - [ ] [Learn More](https://medium.com/@williamwarley/ensuring-iac-security-with-checkov-a-practical-integration-guide-for-azure-devops-gitlab-and-cc8bcfa3d3e9)


## 🎓 Learning Checkpoints

After each section, test your understanding:

```markdown
- [ ] Can you explain why we're using a remote state for Terraform?
- [ ] Why is automated testing crucial in a DevOps pipeline?
- [ ] How does CI/CD improve the deployment process?
```

## Conclusion
By following this tutorial, you'll not only deploy an example app on Azure but also gain valuable insights into modern DevOps practices and tools. 

Let's embark on this journey to transform your organisation into a lean, agile, and competitive force in the digital landscape. Happy deploying! 🚀🔧
