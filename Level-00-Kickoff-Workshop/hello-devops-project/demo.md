# Azure DevOps Demo - CI/CD for Python Project

This guide will walk you through setting up a CI/CD pipeline for a Python project using Azure DevOps.

## 1. Explain Azure DevOps Tool
Azure DevOps provides various services to manage software development projects:

- **Boards**: Agile project management tool for tracking work items, sprints, and backlogs.
- **Pipelines**: Automate build, test, and deployment processes.
- **Test Plans**: Manage manual and automated testing.
- **Artifacts**: Store and share packages across projects.

## 2. Initialize the Repo

1. Navigate to Azure DevOps and create a new repository.
2. Clone the repository to your local machine using:
   ```bash
   git clone https://your-username@dev.azure.com/your-org/your-project/_git/your-repo
   ```

## 3. Create a Simple Pipeline

1. Go to **Pipelines** in Azure DevOps.
2. Click **Create Pipeline** and select your repository.
3. Choose **Empty Pipeline** to define from scratch or use a **Template**.
4. Save and run the pipeline.

## 4. Some Basics of the Agent
Azure Pipelines use agents to execute tasks:
- **Microsoft-hosted agents**: Managed by Azure.
- **Self-hosted agents**: Run on your own machine.

### Add a Basic Hello World
```yaml
trigger:
  - main

pool:
  vmImage: 'ubuntu-latest'

steps:
- script: echo "Hello World!"
  displayName: 'Hello World Task'
```

## 5. How to Edit and See the Logs

1. Navigate to **Pipelines** and select your pipeline.
2. Click **Edit** to modify the YAML file.
3. View logs by selecting a pipeline run and clicking on individual tasks.

## 6. Talk About the Basic Agent Run

- The agent downloads the repository.
- It runs the defined pipeline steps.
- The pipeline logs show execution status and errors.

## 7. Initialize the Repo and Work on a Simple Python Project

If you face authentication errors while cloning, try these URLs:
- First URL:
  ```bash
  git clone https://sumitdraj@dev.azure.com/sumitdraj/training-demo/_git/training-demo
  ```
- Alternative URL:
  ```bash
  git clone https://sumit.d.raj@dev.azure.com/sumitdraj/training-demo/_git/training-demo
  ```

## 8. Get the Python Project and Run Locally

1. Clone the repo (if not already done).
2. Create a virtual environment:
   ```bash
   python -m venv venv
   ```
3. Activate the environment:
   ```bash
   source venv/bin/activate  # macOS/Linux
   .\venv\Scripts\activate  # Windows
   ```
4. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
5. Run the project:
   ```bash
   python app.py
   ```

## 9. Setup CI/CD with Instructions in the README File

### Define CI/CD Pipeline
```yaml
trigger:
- main  # Or your desired branch

pool:
  vmImage: 'ubuntu-latest'  # You can change this if you want to use another VM image

variables:
  # Optional: Specify the name of the web app to deploy
  azureSubscription: 'srstesttest2'  # Replace with your Azure service connection
  appName: 'devopstraining2'  # Replace with your actual Azure Web App name
  packagePath: '$(Build.ArtifactStagingDirectory)/drop/myapp.zip'  # Package location

steps:

# Step 1: Setup Python environment
- task: UsePythonVersion@0
  inputs:
    versionSpec: '3.x'  # Set this to your desired Python version
    addToPath: true

# Step 2: Install dependencies
- script: |
    python -m venv venv  # Create a virtual environment
    source venv/bin/activate  # Activate the virtual environment
    pip install -r requirements.txt  # Install dependencies from requirements.txt
  displayName: 'Install Python Dependencies'

# Step 3: Create a deployment package
- script: |
    # Ensure the target directory exists
    mkdir -p $(Build.ArtifactStagingDirectory)/drop
    
    # Zip the project files, excluding unnecessary files like .git and .venv
    zip -r $(Build.ArtifactStagingDirectory)/drop/myapp.zip . -x "*.git*" -x "venv/*"
  displayName: 'Create Deployment Package'

# Step 4: Publish artifacts (the zip file containing the app)
- task: PublishBuildArtifacts@1
  inputs:
    artifactName: 'drop'  # Name of the artifact to be published
    publishLocation: 'Container'
  displayName: 'Publish Artifacts'

# Step 5: Deploy to Azure Web App
- task: AzureWebApp@1
  inputs:
    azureSubscription: $(azureSubscription)  # Use the Azure service connection
    appName: $(appName)  # Azure Web App name
    package: $(packagePath)  # Path to the zip file
    # appType: webAppLinux  # Assuming you're using Linux-based web hosting, otherwise change to webApp
  displayName: 'Deploy to Azure Web App'

```

## 10. Run and Show After Making a Small Change

1. Modify `app.py` (e.g., update a function or print statement).
2. Commit and push the changes:
   ```bash
   git add .
   git commit -m "Updated app.py"
   git push
   ```
3. The pipeline will trigger automatically.
4. Verify the changes in the deployed application.

---
This guide provides a structured flow for demonstrating Azure DevOps and setting up CI/CD for a Python project.

