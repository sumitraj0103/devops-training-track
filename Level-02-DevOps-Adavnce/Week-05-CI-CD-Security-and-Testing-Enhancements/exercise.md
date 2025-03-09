## 🧪 Labs

Track your progress by checking the boxes for each lab.

## Topics Covered

- Adding security aspects to CI/CD pipelines.
- Including unit testing in the project scope.
- Integrating code quality and vulnerability checks.
- Implementing approval steps before deployment.

## Exercises

### Exercise 1: Deploy Infrastructure with Terraform and Checkov

1. **Setup Terraform**:
    - [ ] Create an Azure Resource Group.
    - [ ] Create an Azure Virtual Network (VNET).
    - [ ] Create a Log Analytics Workspace.
    - [ ] Create a Windows 2022 DC Virtual Machine.
    - Use one module from Microsoft verified modules [Link](https://azure.github.io/Azure-Verified-Modules/).

2. **Run Checkov**:
    - [ ] Install and run [Checkov](https://github.com/bridgecrewio/checkov/) to check for security issues in the Terraform code.
    - [ ] Integrate Checkov into the CI/CD pipeline to ensure code quality.

### Exercise 2: Code Quality and Vulnerability Checks with SonarQube

1. **Setup SonarQube**:
    - [ ] Install and configure [SonarQube](https://www.sonarqube.org/) to check for code quality and vulnerabilities.
    - [ ] Integrate SonarQube into the CI/CD pipeline.

2. **Run SonarQube**:
    - [ ] Run SonarQube analysis on the Terraform code to identify code quality issues and vulnerabilities.

### Exercise 3: CI/CD Pipeline with Approval Step

1. **Create CI/CD Pipeline**:
    - [ ] Create a CI/CD pipeline with the following stages:
        - **Stage 1: Scan & Build**
            - Jobs:
                - [ ] Checkov: Run Checkov to check for security issues in the code.
                - [ ] SonarQube: Run SonarQube to check for code quality and vulnerabilities in the code.
        - **Stage 2: Test**
            - Jobs:
                - [ ] Unit Test: Run unit tests to ensure the code is working as expected.
        - **Stage 3: Deploy**
            - Jobs:
                - [ ] Approval: Add an approval step before deploying the code to the production environment.
                - [ ] Terraform Apply: Deploy the code to the production environment.

2. **Integrate with Pull Requests**:
    - [ ] Configure the pipeline to run Checkov and SonarQube checks on pull requests before merging to the main branch.

## 🧪 Labs

Track your progress by checking the boxes for each lab.

### Prerequisites

Ensure you have the following prerequisites in place before starting:
1. [ ] An active Azure Subscription.
2. [ ] Access to Azure DevOps or GitHub Actions for CI/CD pipeline.
3. [ ] Service Connection to the Azure Subscription in Azure DevOps or GitHub Actions.
4. [ ] An active repository in Azure DevOps or GitHub Actions.

### Main Sections

1. **Terraform** - Test with [Integration Test File](./assets/integration-testing/)
    - [ ] Execute the Terraform configuration files from your local machine.
    - [ ] Create a basic pipeline to execute it from Azure DevOps or GitHub Actions.

2. **Automated Testing** - Ensure code quality:
    - [ ] Install and run [Checkov](https://github.com/bridgecrewio/checkov/) - A static code analysis tool for infrastructure-as-code.
    - [ ] Update the first stage to run Checkov - Add Checkov to the first stage of the pipeline to ensure code quality.
    - [ ] [Learn More](https://medium.com/@williamwarley/ensuring-iac-security-with-checkov-a-practical-integration-guide-for-azure-devops-gitlab-and-cc8bcfa3d3e9).

3. **Code Quality and Vulnerability Checks** - Integrate SonarQube:
    - [ ] Install and configure [SonarQube](https://www.sonarqube.org/) to check for code quality and vulnerabilities.
    - [ ] Integrate SonarQube into the CI/CD pipeline.

4. **Approval Step** - Add an approval step before deployment:
    - [ ] Configure the pipeline to include an approval step before deploying the code to the production environment.

## 🎓 Learning Checkpoints

Test your understanding after each section:

```markdown
- [ ] Why is automated testing crucial in a DevOps pipeline?
- [ ] How does CI/CD improve the deployment process?
- [ ] How does Checkov enhance the security of your infrastructure-as-code?
- [ ] What is the purpose of the Terraform validate command?
- [ ] Why is it important to test Terraform configurations locally before deploying them through a CI/CD pipeline?
- [ ] How does SonarQube help in maintaining code quality and security?
- [ ] What is the significance of an approval step in a CI/CD pipeline?
```

## Conclusion

By following this tutorial, you'll not only deploy an example app on Azure but also gain valuable insights into modern DevOps practices and tools.

Embark on this journey to transform your organization into a lean, agile, and competitive force in the digital landscape. Happy deploying! 🚀🔧
