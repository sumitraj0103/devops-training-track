## Let's create a simple "Hello, World!" Python application and set up a Continuous Integration (CI) pipeline using GitHub Actions, which builds a Docker image and stores the artifact.

### 1. Create a Hello World Python Application
First, let's create a simple Python application. Here's the project structure:
```my-python-app/
├── .github/
│   └── workflows/
│       └── ci.yml
├── Dockerfile
├── hello.py
└── requirements.txt
```



### 2. Create the Python File (hello.py)
This is a simple Python script that prints "Hello, World!":
```# hello.py
print("Hello, World!")
`````

### 3. Create requirements.txt
If your project doesn't have any dependencies, this file can remain empty, or you can list any required dependencies here. For this example, we don’t need any additional dependencies:

```# requirements.txt (empty or include any necessary dependencies) ```

### 4. Create the Dockerfile
We'll build a simple Docker image for the Python application. The Dockerfile will install Python, copy the script, and run it. 

```# Dockerfile
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Copy the Python script into the container
COPY hello.py .

# Run the script when the container starts
CMD ["python", "hello.py"]
```

### 5. Create the GitHub Actions Workflow (ci.yml)
Now, create a workflow for GitHub Actions to build the Docker image and store the artifact. The workflow YAML file will be placed in .github/workflows/ci.yml.

```
name: Python CI/CD with Docker

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      # Checkout the repository
      - name: Checkout code
        uses: actions/checkout@v3

      # Set up Python
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.8'

      # Install dependencies (if any)
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt

      # Build Docker image
      - name: Build Docker image
        run: |
          docker build -t my-python-app .

      # Optionally push the Docker image to DockerHub (replace with your own credentials)
      - name: Push Docker image to DockerHub
        run: |
          echo ${{ secrets.DOCKER_PASSWORD }} | docker login -u ${{ secrets.DOCKER_USERNAME }} --password-stdin
          docker tag my-python-app:latest ${{ secrets.DOCKER_USERNAME }}/my-python-app:latest
          docker push ${{ secrets.DOCKER_USERNAME }}/my-python-app:latest

      # Store Docker image as an artifact (optional)
      - name: Save Docker image as artifact
        uses: actions/upload-artifact@v4
        with:
          name: my-python-app-image
          path: ./my-python-app.tar

      # Build Binary (optional if you want to generate a binary instead of a Docker image)
      - name: Install PyInstaller
        run: |
          pip install pyinstaller
      - name: Build Binary (optional)
        run: |
          pyinstaller --onefile hello.py
      - name: Upload Binary as artifact (optional)
        uses: actions/upload-artifact@v4
        with:
          name: my-python-binary
          path: dist/hello
```

### 6. Add DockerHub Credentials as Secrets
In the above workflow, we're using DockerHub for image storage. 
Please create an account on dockerhub and create a personnal access token (profile -> Account settings -> Personal access tokens). 
Also, please create/reuse your repository in dockerhub ("my-python-app" in our case used for the example)
To push images, you need to add your DockerHub credentials as GitHub secrets:

1. Go to **Settings(of the repository) > Secrets and variables > actions > New repository secret.**
2. Add secrets DOCKER_USERNAME(not your email) and DOCKER_PASSWORD(the access key previously created).
These secrets will allow the GitHub Actions workflow to authenticate with DockerHub.

### 7. Pushing Code to GitHub
Now, push all these files to your GitHub repository:
```git init
git add .
git commit -m "Initial commit with CI pipeline"
git branch -M main
git remote add origin https://github.com/your-username/my-python-app.git
git push -u origin main
```

### 8. Triggering the CI Workflow
Once you push the code to the main branch (or create a pull request), GitHub Actions will trigger the CI pipeline defined in ci.yml.

The pipeline will install dependencies, build the Docker image, and store it as an artifact.
If you've set up the DockerHub credentials, it will push the Docker image to DockerHub.

### 9. Check the Workflow Results
Go to your GitHub repository.
Click on the Actions tab to see the status of your CI workflow.
If everything goes well, you’ll see the Docker image built, and it can be pushed to DockerHub or stored as an artifact.

### Summary
In this example, we created a simple Python application that prints "Hello, World!" and set up a GitHub Actions pipeline to:

Build a Docker image from the Python script.
Optionally push the Docker image to DockerHub.
Store the Docker image as an artifact.
This CI pipeline automatically runs when code is pushed to the repository, ensuring that the Python application is built, tested, and the artifact (like a Docker image) is generated.
