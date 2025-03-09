## Introduction
In this section, we’ll learn:

  - 🐍 How to create a simple Python web application
  - 🚀 How to deploy it using github Actions CI/CD
    
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

### How to deploy it using CI/CD
This guide helps you deploy Python project using CI/CD

## Prerequisites

Before getting started, make sure you have:
- **Python (3.8 or later)** installed
- **Git** installed
- **Azure CLI** installed
- A **GitHub account** and repository

### Step 1: Create Cloud Instance to deploy application

#### Login to Azure CLI
Login to your Azure account using the Azure CLI:
```sh
az login
```

#### Create an Azure Web App
Run the following command to create an Azure Web App. Replace `<your-app-name>` with a unique name for your app and `<your-resource-group>` with your desired Azure resource group name:
```sh
az webapp up --name <your-app-name> --resource-group <your-resource-group> --runtime "PYTHON:3.9"
```

This command will:
- Create an **Azure Web App**.
- Deploy your Python application.
- Assign a **public URL** to your app.

#### Configure Azure Web App to Use the Startup File
Set the correct startup command for your Python app:
```sh
az webapp config set --name <your-app-name> --resource-group <your-resource-group> --startup-file "python app.py"
```

### Step 2: Automate Deployment(CI/CD) with GitHub Actions (Optional)

You can automate the deployment process using **GitHub Actions**.

#### 1. Set Up Secrets in GitHub

First, go to **GitHub** → **Your Repository** → **Settings** → **Secrets and Variables** → **Actions**. Create two secrets:
- **AZURE_WEBAPP_NAME**: The name of your Azure Web App.
- **AZURE_CREDENTIALS**: The **publish profile** from Azure. To get it:
    - Run the following Azure CLI command to download your **publish profile**:
    ```sh
    az webapp deployment list-publishing-profiles --name <your-app-name> --resource-group <your-resource-group> --xml
    ```
    - Alternatively, go to **Azure Portal** → **App Services** → Your Web App → **Deployment Center** → **Get Publish Profile**.

    Copy the entire **XML content** from the `.publishsettings` file and set it as the `AZURE_CREDENTIALS` secret.

### 2. Create a GitHub Actions Workflow

Create a new directory `.github/workflows/` in your project if it doesn't already exist.

Create a file `.github/workflows/deploy.yml` and add the following content:

```yaml
name: Deploy to Azure Web App

on:
  push:
    branches:
      - main

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.9'

    - name: Install dependencies
      run: |
        cd Level-00-Kickoff-Workshop/hello-devops-project
        pip install -r requirements.txt

    - name: Deploy to Azure
      uses: azure/webapps-deploy@v2
      with:
        app-name: ${{ secrets.AZURE_WEBAPP_NAME }}
        publish-profile: ${{ secrets.AZURE_CREDENTIALS }}
        package: Level-00-Kickoff-Workshop/hello-devops-project
```

### 3. Push Changes to GitHub

Once you push changes to the **main** branch of your repository, the GitHub Action will automatically trigger the deployment to Azure.

```sh
git add .
git commit -m "Add GitHub Actions workflow for Azure deployment"
git push origin main
```

This will trigger the workflow, and your Python app will be deployed to Azure automatically.

---

## Step 7: Verify Automatic Deployment

After pushing changes, visit your Azure Web App’s public URL again:
```
https://<your-app-name>.azurewebsites.net
```

You should see the updated version of your app deployed.

---

## Conclusion

You have successfully deployed a simple **Flask app** to **Azure Web App** using **GitHub Actions**. Now, every time you push changes to **GitHub**, the Azure Web App will automatically update. 🎉

Feel free to modify this template to fit your specific project needs.


Enjoy DevOps Learning! 🎉

