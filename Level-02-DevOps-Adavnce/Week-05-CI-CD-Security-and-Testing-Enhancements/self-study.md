
# DevSecOps: Security and Testing Enhancements

## Introduction

## How can you ensure security of a CI/CD pipeline?

Protecting your code, infrastructure, and applications from vulnerabilities and threats ensures the integrity of your software. By embedding strong security controls and practices within your CI/CD process, you can maintain the reliability and trustworthiness of your development workflow.

Let's explore the essential security best practices that every CI/CD pipeline should follow.

- Establish secure coding practices
- Perform regular security audits and assessments
- Employ CI/CD access controls
- Secure the development environment
- Secure build and deployment processes
- Integrate security testing
- Respond to security incidents
- Stay compliant
- Stay ahead of future trends
- Enhance Cloud detection and response "CDR" capabilities


## Azure DevOps Environments: Checks and Gates

One of the practices almost used in each project or pipeline is implementing Azure DevOps Environments with Checks and Gates. This is especially useful when you want someone to approve your run. Checks and Gates allow you to enforce policies and ensure that certain conditions are met before a deployment can proceed. This can include manual approvals, automated tests, or other criteria that must be satisfied to maintain the integrity and security of your deployment process.

To learn more about this practice, you can watch this video: [Azure DevOps Environments: Checks and Gates](https://www.youtube.com/watch?v=FbXKpo6oEyg&t=1s)


## The Importance of Security Testing
While application security testing is one of the first steps toward the goal of better security, there are several other benefits of testing.

Security testing can increase your uptime and net productivity. Cleaning up after a security lapse is always more labor-intensive than preventing one in the first place. Think about how many companies worldwide have faced class action lawsuits for data breaches. Compare those settlements to the cost of bringing an ethical hacker onto your team.

If industries that are subject to strict privacy regulations use your software, security testing can also help you remain compliant with these regulations. For instance, a firm that creates medical software in the United States needs to stay compliant with the HIPAA, and one that does business in Europe needs to comply with the General Data Protection Regulation.

Integrating a robust culture of security risk assessments and taking the time to “think like a hacker” not only improves your software’s security, but the quality of its code as well. Taking the extra time to review your code for vulnerabilities gives you the opportunity to spot other errors as well.

## Types of Security Testing
There are five different forms of security testing, each of which has a different methodology and purpose. Ideally, you will use a combination of these techniques as needed.

- Penetration testing (ethical hacking) simulates an actual cyberattack to test specific systems for vulnerability.
- Security scanning either manually or automatically looks for system flaws in new code. [Which we will cover in this module]
- Vulnerability scanning checks your software against lists of known vulnerabilities.
- Security auditing is a line-by-line examination of your code that reveals any security holes that you may have previously missed.
- Security risk assessments focus on reducing external threats, categorizing them as “low,” “medium” or “high.”

## Security testing tools
Security testing tools are instrumental in uncovering bugs and security vulnerabilities before your code ships. SAST tools, for instance, analyze your codebase for potential security flaws like injection flaws or authentication issues. By integrating SAST into your development process, you can catch these vulnerabilities during coding, which saves time and resources down the line.

Similarly, dynamic application security testing (DAST) tools are vital for simulating real-world attacks on your running applications. Including DAST in your pipeline ensures thorough testing of your applications in both pre-production and production environments. Additionally, regular third-party audits from independent security firms add a crucial layer of validation, turbocharging the overall security robustness of your applications. With these audits, you get expert eyes that will thoroughly evaluate your systems, uncovering any lurking vulnerabilities and ensuring your defenses are top-notch.

## IaC Scanning with Trivy (Azure DevOps)

### Trivy Vulnerability Scanner
Trivy is a simple and comprehensive scanner for vulnerabilities in container images, file systems, and Git repositories, as well as for configuration issues in IaC. Trivy detects vulnerabilities of OS packages (Alpine, RHEL, CentOS, etc.) and language-specific packages (Bundler, Composer, npm, yarn, etc.). In addition, Trivy scans Infrastructure as Code (IaC) files such as Terraform, Dockerfile and Kubernetes, to detect potential configuration issues that expose your deployments to the risk of attack.


You can scan your Terraform configuration artifacts easily giving you the confidence that all is well with your configuration before deploying your Terraform (IaC) configurations. It is a free/open source tool by AquaSecurity. For more information go check out the Trivy github page

#### Use it with Azure DevOps

1. **Install Trivy**: You can install Trivy on your local machine or use a container image:

```bash
sudo apt-get install rpm
wget https://github.com/aquasecurity/trivy/releases/download/v${{ parameters.trivyVersion }}/trivy_${{ parameterstrivyVersion }}_Linux-64bit.deb
sudo dpkg -i trivy_${{ parameters.trivyVersion }}_Linux-64bit.deb
trivy -v
```
2. Scan your Terraform configuration files:

```bash
trivy config --severity HIGH,CRITICAL --exit-code 1 $(Agent.BuildDirectory)/src/${{ parameters.root_directory }}
# or
trivy config --severity LOW,MEDIUM --exit-code 0 $(Agent.BuildDirectory)/src/${{ parameters.root_directory }}
```
**NOTE** : Trivy will not cause the build process of the pipeline to fail on (LOW/MEDIUM) risks, but will cause a failure if any (HIGH/CRITICAL) issues are detected. This is defined by the --exist-code (1)(0) argument:

3. **Integrate Trivy into Azure DevOps**: You can integrate Trivy into your Azure DevOps pipeline by adding the following task to your pipeline YAML file:

```yaml
- task: CmdLine@2
displayName: "LOW/MED - Trivy vulnerability scanner in IaC mode"
inputs:
    script: |
        trivy config --severity LOW,MEDIUM --exit-code 0 $(Agent.BuildDirectory)/src/${{ parameters.root_directory }}

- task: CmdLine@2
displayName: "HIGH/CRIT - Trivy vulnerability scanner in IaC mode"
inputs:
    script: |
        trivy config --severity HIGH,CRITICAL --exit-code 1 $(Agent.BuildDirectory)/src/${{ parameters.root_directory }}
```
### SonarQube

#### What is SonarCloud?
SonarCloud is a cloud-based code analysis service designed to detect code quality issues in 25 different programming languages, continuously ensuring the maintainability, reliability and security of your code.

#### What Does SonarCloud Do?
SonarCloud uses state-of-the-art techniques in static code analysis to find problems, and potential problems, in the code that you and your team write.

Static analysis is called static because it does not rely on actually running the code (analysis of running code is called dynamic analysis). As a result, SonarCloud offers an additional layer of verification, different from automated testing and human code-review.

Early detection of problems ensures that fewer issues get through to the later stages of the process and ultimately helps to increase the overall quality of your production code.

#### Examples of issues that SonarCloud can detect include:
[Terraform Rules](https://rules.sonarsource.com/terraform/)

### Azure DevOps integration

SonarQube Server's integration with Azure DevOps allows you to maintain code quality and security in your Azure DevOps repositories. It is compatible with both Azure DevOps Server and Azure DevOps Services.

With this integration, you'll be able to:

Import your Azure DevOps repositories into SonarQube Server to easily set up SonarQube Server projects.
Integrate smoothly SonarQube Server analysis into your Azure build pipeline with the Azure DevOps extension for SonarQube. This includes multi-branch analysis features.
Report the analysis' quality gate status right in Azure Pipeline's Build Summary page.
Prevent pull request merges when the quality gate fails.
View issues detected on a pull request in Azure DevOps.
Each issue will be a comment on the Azure DevOps pull request. If you change the status of an issue in SonarQube Server, that status change is immediately reflected in the Azure DevOps interface.  

#### Configuring SonarQube in Azure DevOps or Github
Follow SonarQube documention to configure SonarQube in Azure DevOps or Github. [Link Try SonarQube Cloud for free](https://www.sonarsource.com/products/sonarcloud/signup/)
Step By Step Guide: https://azuredevopslabs.com/labs/vstsextend/sonarcloud/


--------------------------------------------------------------
## Implement Integration Tests for Terraform Projects in Azure

Integration tests validate that a newly introduced code change doesn't break existing code. In DevOps, continuous integration (CI) refers to a process that builds the entire system whenever the code base is changed - such as someone wanting to merge a PR into a Git repo. The following list contains common examples of integration tests:

- Static code analysis tools such as lint and format.
- Run `terraform validate` to verify the syntax of the configuration file.
- Run `terraform plan` to ensure the configuration will work as expected.

In this article, you learn how to:

- Learn the basics of integration testing for Terraform projects.
- Use Azure DevOps to configure a continuous integration pipeline.
- Run static code analysis on Terraform code.
- Run `terraform validate` to validate Terraform configuration files on the local machine.
- Run `terraform plan` to validate that Terraform configuration files from a remote services perspective.
- Use an Azure Pipeline to automate continuous integration.

### 1. Configure your environment

- Terraform Build & Release Tasks extension: Install the Terraform build/release tasks extension into your Azure DevOps organization.
- Example code and resources: [Access The files](./assets/integration-testing/) 

### 2. Validate a local Terraform configuration

The `terraform validate` command is run from the command line in the directory containing your Terraform files. This command's main goal is validating syntax.

- Within the example directory, navigate to the `src` directory.
- Run `terraform init` to initialize the working directory.

```bash
terraform init
```

- Run `terraform validate` to validate the syntax of the configuration files.

```bash
terraform validate
```

Key points:
- You see a message indicating that the Terraform configuration is valid.

Edit the `main.tf` file. On line 5, insert a typo that invalidates the syntax. For example, replace `var.location` with `var.loaction`. Save the file. Run validation again.

```bash
terraform validate
```

Key points:
- You see an error message indicating the line of code in error and a description of the error.

It is a good practice to always run `terraform validate` against your Terraform files before pushing them to your version control system. Also, this level of validation should be a part of your continuous integration pipeline. Later in this article, we'll explore how to configure an Azure pipeline to automatically validate.

### 3. Validate Terraform configuration

In the previous section, you saw how to validate a Terraform configuration. That level of testing was specific to syntax. That test didn't take into consideration what might already be deployed on Azure.

Terraform is a declarative language meaning that you declare what you want as an end-result. Running `terraform plan` allows you to confirm the potential results of applying an execution plan to avoid surprises.

To generate the Terraform execution plan, you run `terraform plan`. This command connects to the target Azure subscription to check what part of the configuration is already deployed. Terraform then determines the necessary changes to meet the requirements stated in the Terraform file. At this stage, Terraform isn't deploying anything. It's telling you what will happen if you apply the plan.

If you're following along with the article and you've done the steps in the previous section, run the `terraform plan` command:

```bash
terraform plan
```

After running `terraform plan`, Terraform displays the potential outcome of applying the execution plan. The output indicates the Azure resources that will be added, changed, and destroyed.

### 4. Run static code analysis

Static code analysis can be done directly on the Terraform configuration code, without executing it. This analysis can be useful to detect issues such as security problems and compliance inconsistency.

The following tools provide static analysis for Terraform files:

- Checkov
- Terrascan
- tfsec
- Deepsource

Static analysis is often executed as part of a continuous integration pipeline. These tests don't require the creation of an execution plan or deployment. As a result, they run faster than other tests and are generally run first in the continuous integration process.

### 5. Automate integration tests using Azure Pipeline

Continuous integration involves testing an entire system when a change is introduced. In this section, you see an Azure Pipeline configuration used to implement continuous integration.

- Using your editor of choice, browse to the local clone of the Terraform sample project on GitHub.
- Open the `assets/integration-testing/src/azure-pipeline.yaml` file.
- Scroll down to the steps section where you see a standard set of steps used to run various installation and validation routines.

Review the line that reads, Step 1: run the Checkov Static Code Analysis. In this step, the Checkov project mentioned earlier runs a static code analysis on the sample Terraform configuration.

```yaml
- bash: $(terraformWorkingDirectory)/checkov.sh $(terraformWorkingDirectory)
  displayName: Checkov Static Code Analysis
```

Key points:
- This script is responsible for running Checkov in the Terraform workspace mounted inside a Docker container. Microsoft-managed agents are Docker enabled. Running tools inside a Docker container is easier and removes the need to install Checkov on the Azure Pipeline agent.
- The `$(terraformWorkingDirectory)` variable is defined in the `azure-pipeline.yaml` file.

Review the line that reads, Step 2: install Terraform on the Azure Pipelines agent. The Terraform Build & Release Task extension that you installed earlier has a command to install Terraform on the agent running the Azure Pipeline. This task is what is being done in this step.

```yaml
- task: charleszipp.azure-pipelines-tasks-terraform.azure-pipelines-tasks-terraform-installer.TerraformInstaller@0
  displayName: 'Install Terraform'
  inputs:
    terraformVersion: $(terraformVersion)
```

Key points:
- The version of Terraform to install is specified via an Azure Pipeline variable named `terraformVersion` and defined in the `azure-pipeline.yaml` file.

Review the line that reads, Step 3: run Terraform init to initialize the workspace. Now that Terraform is installed on the agent, the Terraform directory can be initialized.

```yaml
- task: charleszipp.azure-pipelines-tasks-terraform.azure-pipelines-tasks-terraform-cli.TerraformCLI@0
  displayName: 'Run terraform init'
  inputs:
    command: init
    workingDirectory: $(terraformWorkingDirectory)
```

Key points:
- The `command` input specifies which Terraform command to run.
- The `workingDirectory` input indicates the path of the Terraform directory.
- The `$(terraformWorkingDirectory)` variable is defined in the `azure-pipeline.yaml` file.

Review the line that reads, Step 4: run Terraform validate to validate HCL syntax. Once the project directory is initialized, `terraform validate` is run to validate the configuration on the server.

```yaml
- task: charleszipp.azure-pipelines-tasks-terraform.azure-pipelines-tasks-terraform-cli.TerraformCLI@0
  displayName: 'Run terraform validate'
  inputs:
    command: validate
    workingDirectory: $(terraformWorkingDirectory)
```

Review the line that reads, Step 5: run Terraform plan to validate HCL syntax. As explained earlier, generating the execution plan is done to verify if the Terraform configuration is valid before deployment.

```yaml
- task: charleszipp.azure-pipelines-tasks-terraform.azure-pipelines-tasks-terraform-cli.TerraformCLI@0
  displayName: 'Run terraform plan'
  inputs:
    command: plan
    workingDirectory: $(terraformWorkingDirectory)
    environmentServiceName: $(serviceConnection)
    commandOptions: -var location=$(azureLocation)
```

Key points:
- The `environmentServiceName` input refers to the name of the Azure service connection created in Configure your environment. The connection allows Terraform to access your Azure subscription.
- The `commandOptions` input is used to pass arguments to the Terraform command. In this case, a location is being specified. The `$(azureLocation)` variable is defined earlier in the YAML file.


## 💡 Pro Tip

1. **Integration Testing**: You can use Azure PowerShell or bash scripts to run your integration tests. Here’s a streamlined approach:
  - Develop new resources using tools like Terraform. For instance, create a virtual machine.
  - Before the release in your pipeline, run the tests using Terraform with dummy variables.
  - Use PowerShell or bash scripts to execute tests, such as verifying that the VM does not have a public IP, ensuring the VM has Log Analytics Workspace (LAW) configured, etc.
  - Destroy the environment after testing.
  - This method is widely used for integration testing with Terraform due to its simplicity and effectiveness.

2. **Security Testing**: Utilize tools like Trivy, SonarQube, and Snyk to scan your code and infrastructure for vulnerabilities and security issues. SonarQube and Snyk are particularly popular for their comprehensive scanning capabilities.

