
## Introduction
In this section, we’ll learn:

  - 🐍 How to create a simple Python web application
  - 🚀 How to deploy it using Azure DevOps  CI/CD
    
Let’s dive into building and automating your Python web app! 🌐✨
   
### How to create Python web app
This guide helps to create application locally Flask that displays a "Hello, World!" message.

#### Prerequisites

Make sure you have Python installed. You can check by running:

```sh
python --version
```

If you don't have Python, download and install it from [python.org](https://www.python.org/downloads/).

#### Step 1: Install Flask

Install Flask using pip:

```sh
pip install flask
```

#### Step 2: Create Your Flask App

Create a Python file named `app.py` and add the following code:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello DevOps! My Name is Sumit"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```
## 📂 Create this Project Structure
```
hello-world-python/
│── .azure-pipelines/        # Azure DevOps pipeline YAML files
│   ├── azure-pipelines.yml  # CI/CD Pipeline file
│── app.py                   # Python Application
│── requirements.txt         # Dependencies
│── startup.txt              
│── web.config               # WebApp config
│── .gitignore               # Ignore unnecessary files
│── README.md                # Project documentation

You can get the reference from here --> https://github.com/sumitraj0103/devops-training-track/tree/main/Level-00-Kickoff-Workshop/hello-devops-project
```
## 🔹 .gitignore File
```txt
venv/
__pycache__/
dist/
build/
*.pyc
.DS_Store
.env
```

#### Step 3: Run the Flask App Locally

In the terminal, navigate to your project folder and run:

```sh
python app.py
```

You should see output similar to:

```
Running on http://127.0.0.1:<port>
```

#### Step 4: Open in Browser

Open your web browser and go to:

```
http://127.0.0.1:5000/

```

You should see **"Hello, World!"** displayed on the page.

🔹 Ensures unnecessary files are not tracked by Git.

## 🔹 CI/CD Pipeline with Azure DevOps

### **1️⃣ Configure Azure Web App**
1. **Go to Azure Portal → App Services → Create Web App**
2. Set **Runtime Stack** to `Python 3.10`
3. Make sure to select the enable basic authentication under deployment section
<img width="548" alt="image" src="https://github.com/user-attachments/assets/01c70e2e-31f5-4dd7-989a-cc2bafa40acb" />

   <img width="551" alt="image" src="https://github.com/user-attachments/assets/8142ff07-8601-4ef1-9d25-e5fede4c393b" />

5. Create a **Service Connection** in Azure DevOps

### **2️⃣ Set Up Azure DevOps Pipeline**
1. **Go to Azure DevOps → Pipelines → New Pipeline**
2. Select empty pipeline

## 🔹 Azure DevOps Pipeline (azure-pipelines.yml)
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

4. Save and run the pipeline

### **3️⃣ Pipeline Stages**
#### **Build Stage:**
✅ Install dependencies  
✅ Run unit tests  
✅ Build Python package  
✅ Publish artifacts  

#### **Deploy Stage:**
✅ Download artifacts  
✅ Deploy to Azure Web App  
✅ Verify deployment  

## 🚀 Deploying to Azure Web App
Once the pipeline runs successfully, the app is deployed at:
```
https://your-web-app-name.azurewebsites.net/
```

## 🎯 Next Steps
- 🔹 **Database Integration** (PostgreSQL, MySQL, etc.)
- 🔹 **Environment Variables & Secrets Management**
- 🔹 **Logging & Monitoring with Azure Application Insights**


